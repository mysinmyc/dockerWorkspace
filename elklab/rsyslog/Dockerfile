FROM centos:7

RUN yum install -y rsyslog

COPY rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT [ "rsyslogd","-dn" ]

EXPOSE 10514/udp
EXPOSE 11514
