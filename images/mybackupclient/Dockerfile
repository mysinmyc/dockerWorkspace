FROM ubuntu

RUN apt-get update 

RUN apt-get install -y --no-install-recommends rsync openssh-client zbackup git ca-certificates fuse etherwake

ADD rclone /usr/local/bin
