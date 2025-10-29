FROM n8nio/n8n:latest

# Root ol
USER root

# Python3 + pip + venv kur
RUN apk add --no-cache python3 py3-pip py3-virtualenv

# Virtual environment oluştur
RUN python3 -m venv /opt/venv

# Kütüphaneyi kur
RUN /opt/venv/bin/pip install --no-cache-dir sportradar-unofficial

# Python site-packages yolunu dinamik bul
RUN PYTHON_SITE=$(python3 -c "import site; print(site.getsitepackages()[0])" 2>/dev/null || echo "/opt/venv/lib/python3.11/site-packages") && \
    echo "Using site-packages: $PYTHON_SITE" && \
    ls -la $PYTHON_SITE | grep -i sportradar || true

# PATH ve PYTHONPATH'i ayarla
ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONPATH="/opt/venv/lib/python3.11/site-packages:/opt/venv/lib/python3.12/site-packages:$PYTHONPATH"

# KURULUMU DOĞRULA (loglarda göreceksin)
RUN /opt/venv/bin/python -c "import sportradar, sys; print('sportradar BAŞARIYLA KURULDU! Version:', sportradar.__version__ if hasattr(sportradar, '__version__') else 'unknown'); print('Python path:', sys.path)" || echo "sportradar import failed in build"

# Kullanıcıyı node'a döndür
USER node

# n8n'i başlat
CMD ["n8n", "start"]
