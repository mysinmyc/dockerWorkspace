elklab
======

This docker-compose allow to start a lab for an elk stack

Filebeat perfom ingest of files coming from a shared volume. This path contains logs of
- squid proxy service exposed to port 3128 or 3129 (with ssl bump)
- an httpd listening on port 8080
- an rsyslog listening on port 10514/udp or 11514/tcp

data can be accessed trough a kibana listeling on http://{host}:5601
