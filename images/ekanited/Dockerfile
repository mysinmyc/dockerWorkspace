FROM alpine

RUN apk update \
	&& apk add libc6-compat

RUN adduser -D ekanite

ADD ekanited /usr/local/bin

RUN mkdir /var/opt/ekanite 
	
RUN chown ekanite /var/opt/ekanite /usr/local/bin/ekanited

USER ekanite

EXPOSE 8080 5514 10514 9951

VOLUME /var/opt/ekanite 

ENTRYPOINT /usr/local/bin/ekanited --queryhttp 0.0.0.0:8080 --tcp 0.0.0.0:5514 --udp 0.0.0.0:10514 -diag 0.0.0.0:9951
