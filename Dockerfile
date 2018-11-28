FROM python:2.7-alpine

ARG LEKTOR_RELEASE=3.1.2

RUN apk add --no-cache make nodejs yarn imagemagick

RUN apk add --no-cache --virtual build-deps gcc python2-dev musl-dev openssl-dev libffi-dev \
    && pip install "Lektor==$LEKTOR_RELEASE" \
    && apk del build-deps

RUN pip install lektor-webpack-support
RUN apk add --no-cache sassc

WORKDIR /opt/lektor

RUN set -x \
    && addgroup -g 1000 -S lektor \
    && adduser -u 1000 -D -S -G lektor lektor

USER lektor

RUN mkdir -p /home/lektor/.cache
