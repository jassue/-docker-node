FROM node:12.14.0-alpine
MAINTAINER jassue

ENV APP_DIR=/app \
    NODE_ENV=development

RUN apk add --no-cache git openssh \
    && npm install -g nrm \
    && nrm use taobao \
    && npm install -g pm2 \
    && mkdir $APP_DIR

WORKDIR $APP_DIR

EXPOSE 80
EXPOSE 8080

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node"]
