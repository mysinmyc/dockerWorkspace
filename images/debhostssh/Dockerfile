FROM debian:jessie

#Welcome back bash
RUN update-alternatives --install /bin/sh  sh /bin/bash 99

RUN apt-get update \
#	&& apt-get -y upgrade \
	&& apt-get -y install vim ssh sudo \
	&& apt-get clean

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

#VOLUME /home

#Default user
ENV ADDUSERS_IDS=user
ENV ADDUSERS_GROUPS=sudo

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
