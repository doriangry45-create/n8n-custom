FROM n8nio/n8n:latest

USER root

# Python3 + pip + venv kur
RUN apk add --no-cache python3 py3-pip py3-virtualenv

# Virtual environment oluştur
RUN python3 -m venv /opt/venv

# Kütüphaneyi venv'e kur
RUN /opt/venv/bin/pip install --no-cache-dir sportradar-unofficial

# PATH ve PYTHONPATH'i ayarla
ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONPATH="/opt/venv/lib/python3.11/site-packages:$PYTHONPATH"

# KURULUMU LOGLA (KONTROL İÇİN)
RUN echo "=== PYTHON PATHS ===" && \
    ls -la /opt/venv/bin/ && \
    ls -la /opt/venv/lib/python3.11/site-packages/ | grep sportradar && \
    /opt/venv/bin/python -c "import sportradar; print('sportradar BAŞARIYLA KURULDU!')"

USER node

CMD ["n8n", "start"]
# Trigger workflow run
