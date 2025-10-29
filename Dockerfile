FROM n8nio/n8n:latest

# Root ol
USER root

# Python3 + pip + venv kur
RUN apk add --no-cache python3 py3-pip py3-virtualenv

# Virtual environment oluştur
RUN python3 -m venv /opt/venv

# Kütüphaneyi venv'e kur
RUN /opt/venv/bin/pip install sportradar-unofficial

# n8n'in çalışacağı ortamda PATH'i ayarla
ENV PATH="/opt/venv/bin:$PATH"

# n8n'in PYTHONPATH'ini de ayarla (garanti olsun)
ENV PYTHONPATH="/opt/venv/lib/python3.*/site-packages:$PYTHONPATH"

# Kullanıcıyı node'a döndür
USER node

# n8n'i başlat
CMD ["n8n", "start"]
