FROM n8nio/n8n:latest

# Gerekli paketleri kur (python3, pip)
USER root
RUN apk add --no-cache python3 py3-pip

# pip ile kütüphaneyi kur
RUN pip3 install sportradar-unofficial

# Kullanıcıyı n8n'e geri döndür
USER node

# n8n'i başlat
CMD ["n8n", "start"]
