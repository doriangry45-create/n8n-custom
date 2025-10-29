FROM n8nio/n8n:latest

# sportradar-unofficial kütüphanesini kur
RUN pip install sportradar-unofficial

# n8n'i başlat
CMD ["n8n", "start"]
