FROM debian:latest

RUN apt-get update && apt-get install -y tor

# نسخ ملف إعدادات Tor
COPY torrc /etc/tor/torrc

# التعرض للمنفذ الذي سيعمل عليه Tor
EXPOSE 9050

CMD ["tor"]
