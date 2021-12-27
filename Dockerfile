FROM python:3.11.0a3-alpine3.15

WORKDIR /usr/src/app

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade telethon

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        bash-doc \
        bash-completion \
        vim \
        proxychains-ng \
        && sed -i '/127.0.0.1 9050/c192.168.50.1 1080' /etc/proxychains/proxychains.conf \  ##修改替换成你的代理服务器IP以及端口
        && rm -rf /var/cache/apk/* \
        && /bin/bash

COPY . .
