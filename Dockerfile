FROM alpine:latest
MAINTAINER furious.luke@gmail.com

RUN mkdir -p /run/nginx/templ && \
    apk add --update nginx gettext && \
    rm -rf /var/cache/apk/*

ADD nginx.conf /etc/nginx/templ/nginx.conf

ENV WORKER_PROCESSES=1
ENV WORKER_CONNECTIONS=1024
ENV SERVER_NAME=dev

CMD envsubst '$WORKER_PROCESSES $WORKER_CONNECTIONS $SERVER_NAME' < /etc/nginx/templ/nginx.conf > /etc/nginx/nginx.conf && nginx -g 'daemon off;'
