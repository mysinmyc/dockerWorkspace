FROM alpine

RUN apk add -U squid

ADD squid.conf /etc/squid/squid.conf

RUN /usr/lib/squid/security_file_certgen -s /var/cache/squid/ssl_db -c -M 4MB

EXPOSE 3128

EXPOSE 3129

CMD ["/usr/sbin/squid", "-N"]
