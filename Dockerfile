FROM node:latest
ARG INPUT_XMLFILE
ENV INPUT_XMLFILE_ENV = ${INPUT_XMLFILE}
ARG INPUT_YMLFILE
ENV INPUT_YMLFILE_ENV = ${INPUT_YMLFIL
WORKDIR /home/node/app
COPY package*.json /
RUN npm i
COPY . .
RUN npm run build
LABEL authors="rhycce"

ENTRYPOINT node /home/node/app/dist/feed ${INPUT_XMLFILE_ENV} ${INPUT_YMLFILE_ENV}