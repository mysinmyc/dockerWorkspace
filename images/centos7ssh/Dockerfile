FROM centos:7


RUN yum update -y \
	&& yum -y install vim ssh sudo openssh-server openssh-clients \
	&& yum clean all

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh


#Configure sshd
RUN sed -i \
	-e "s/^.*UsePAM.*$//g" \
	-e "s/^.*UseDNS.*$//g" \
	-e "s/^.*PasswordAuthentication.*$//g" \
	/etc/ssh/sshd_config \
	&& echo -e 'UseDNS no\nUsePAM no\nPasswordAuthentication yes' >> /etc/ssh/sshd_config


#Default user
ENV ADDUSERS_NAMES=user
ENV ADDUSERS_GROUPS=wheel

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
