FROM node:latest
ARG xmlFile=feed.xml
ARG yamlFile=feed.yml
WORKDIR /home/node/app
COPY package*.json /
RUN npm i
COPY . .
RUN npm run build
LABEL authors="rhycce"

ENTRYPOINT ["node", "/home/node/app/dist/feed", "$xmlFile", "$yamlFile"]