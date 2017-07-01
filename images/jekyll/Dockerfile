FROM centos:7


RUN yum update -y \
        && yum -y install vim ruby git gcc ruby-devel make \
        && yum clean all

RUN gem install jekyll bundler json

RUN jekyll new /jekyll
