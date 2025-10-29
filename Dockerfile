FROM n8nio/n8n:latest

# Root ol
USER root

# Python3 + pip + venv kur
RUN apk add --no-cache python3 py3-pip py3-virtualenv

# Virtual environment oluştur
RUN python3 -m venv /opt/venv

# Virtual environment'i aktif et + kütüphaneyi kur
RUN /opt/venv/bin/pip install sportradar-unofficial

# n8n'in PATH'ine venv ekle
ENV PATH="/opt/venv/bin:$PATH"

# Kullanıcıyı node'a döndür
USER node

# n8n'i başlat
CMD ["n8n", "start"]
