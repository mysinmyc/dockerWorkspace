FROM docker.elastic.co/beats/filebeat:7.3.1

COPY filebeat.yml /filebeat.yml

CMD ["/usr/share/filebeat/filebeat", "-c", "/filebeat.yml", "--strict.perms=false"]


