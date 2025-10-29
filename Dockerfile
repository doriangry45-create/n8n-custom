FROM n8nio/n8n:latest

# Gerekli paketleri kur (python3, pip)
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# pip ile kütüphaneyi kur
RUN pip3 install sportradar-unofficial

# Kullanıcıyı n8n'e geri döndür
USER node

# n8n'i başlat
CMD ["n8n", "start"]
