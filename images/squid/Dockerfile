FROM alpine

RUN apk add -U squid

ADD squid.conf /etc/squid/squid.conf

EXPOSE 3128

CMD ["/usr/sbin/squid", "-N"]
