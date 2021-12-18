FROM python:3.11.0a3-alpine3.15

WORKDIR /usr/src/app

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade telethon

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
        && /bin/bash

COPY . .