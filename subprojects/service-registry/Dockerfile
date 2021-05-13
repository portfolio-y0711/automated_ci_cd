FROM node:14-slim

WORKDIR /usr/app

COPY registry.tar.gz .

RUN tar zxf registry.tar.gz

RUN mv package.deploy.json package.json

RUN npm install

RUN npm i -g ts-node

EXPOSE 7000

CMD ["ts-node", "-r", "tsconfig-paths/register", "--files", "bin/www.ts"]
