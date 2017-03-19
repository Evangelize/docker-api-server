# Install classes-server
#
# VERSION 0.1.0
FROM keymetrics/pm2-docker-alpine:6
MAINTAINER Matt Voss "voss.matthew@gmail.com"
WORKDIR /data/app

# If you have native dependencies, you'll need extra tools
RUN apk add --update git make gcc g++ python mysql-client

# If you need npm, use mhart/alpine-node or mhart/alpine-iojs
# RUN npm install

RUN mkdir -p /root/.ssh/

# Clone
RUN git clone --verbose https://github.com/Evangelize/api-server.git /data/app && \
true && ls /data/app

# Add custom settings.json to /data/app
ADD settings.json.dist /data/dist/settings.json.dist
ADD config.json.dist /data/dist/config.json.dist

# Install server with NPM
RUN cd /data/app  && npm install && npm install -g gulp sequelize-cli && npm run deploy

ADD install.sh /data/install.sh
RUN chmod +x /data/install.sh
ADD run.sh /data/run.sh
RUN chmod +x /data/run.sh

# If you had native dependencies you can now remove build tools
RUN apk del make gcc g++ python && \
   rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp

EXPOSE 3001
VOLUME ["/data/app"]
CMD ["/data/run.sh"]
