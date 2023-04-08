FROM dart:latest

RUN useradd -m build

USER build 

WORKDIR /home/build

RUN git clone https://github.com/flutter/flutter.git -b stable

ENV PATH="/usr/local/bin:/usr/bin:/bin:/home/build/flutter/bin"

RUN mkdir /home/build/src

WORKDIR /home/build/src

RUN flutter precache --no-universal --web
