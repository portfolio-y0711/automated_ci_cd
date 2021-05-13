FROM node:14-slim

WORKDIR /usr/app

COPY api.tar.gz .

RUN tar zxf api.tar.gz

RUN mv package.deploy.json package.json

RUN npm install

RUN npm i -g ts-node

ENV SERVER_PORT=3010

EXPOSE 3010

CMD ["ts-node", "-r", "tsconfig-paths/register", "--files", "bin/www.ts"]
