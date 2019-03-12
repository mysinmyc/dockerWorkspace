FROM docker.elastic.co/beats/filebeat:6.5.4

COPY filebeat.yml /filebeat.yml

CMD ["/usr/share/filebeat/filebeat", "-c", "/filebeat.yml", "--strict.perms=false"]


