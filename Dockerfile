FROM nginx:alpine

RUN apk add --no-cache openssl
ENV DOCKERIZE_VERSION v0.5.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY nginx.tmpl /etc/nginx/nginx.tmpl
COPY htpasswd.tmpl /etc/nginx/htpasswd.tmpl
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

CMD entrypoint.sh
