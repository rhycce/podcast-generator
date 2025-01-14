FROM ubuntu:latest
ARG xmlFile=feed.xml
ARG yamlFile=feed.yml

RUN apt-get update && apt-get -y git

RUN mkdir -p /home/node/app/node_modules

COPY src/* /home/node/app/
COPY package*.json /home/node/app/
COPY tsconfig.json /home/node/app/
COPY entrypoint.sh /home/node/app/

LABEL authors="rhycce"

ENTRYPOINT ["/entrypoint.sh", "$xmlFile", "$yamlFile"]