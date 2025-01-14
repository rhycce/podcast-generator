FROM node:latest
ARG INPUT_XMLFILE
ARG INPUT_YMLFILE
WORKDIR /home/node/app
COPY package*.json /
RUN npm i
COPY . .
RUN npm run build
LABEL authors="rhycce"

ENTRYPOINT ["node", "/home/node/app/dist/feed", "${INPUT_XMLFILE}", "${INPUT_YMLFILE}"]