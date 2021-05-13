FROM node:14-slim

WORKDIR /usr/app

COPY gateway.tar.gz .

RUN tar zxf gateway.tar.gz

RUN mv package.deploy.json package.json

RUN npm install

RUN npm i -g ts-node

EXPOSE 8000

CMD ["ts-node", "-r", "tsconfig-paths/register", "--files", "bin/www.ts"]
