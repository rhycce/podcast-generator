FROM ubuntu:latest

RUN apt-get update
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
RUN install node
RUN apt-get -y git
RUN node -v
RUN npm -v

COPY src/feed.ts /usr/bin/feed.ts
COPY src/xmlHandler.ts /usr/bin/xmlHandler.ts
COPY src/yamlHandler.ts /usr/bin/xmlHandler.ts
COPY entrypoint.sh /entrypoint.sh

LABEL authors="janet"

ENTRYPOINT ["entrypoint.sh"]