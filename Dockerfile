# استخدم صورة ديبيان الأساسية
FROM debian:latest

# تثبيت Tor
RUN apt-get update && apt-get install -y tor

# إنشاء ملف torrc مخصص داخل الحاوية
RUN echo "SocksPort 0.0.0.0:9050" > /etc/tor/torrc && \
    echo "ExitNodes {US}" >> /etc/tor/torrc && \
    echo "Log notice file /var/log/tor/notices.log" >> /etc/tor/torrc

# إعداد الأذونات اللازمة لمجلد السجلات
RUN mkdir -p /var/log/tor && chown debian-tor:debian-tor /var/log/tor

# التعرض للمنفذ 9050 لتوصيل طلبات SOCKS
EXPOSE 9050

# الأمر الافتراضي لتشغيل Tor
CMD ["tor"]
