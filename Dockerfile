FROM alpine:latest
MAINTAINER furious.luke@gmail.com

RUN mkdir -p /run/nginx && \
    apk add --update nginx && rm -rf /var/cache/apk/*

ADD nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]
