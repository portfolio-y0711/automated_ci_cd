FROM node:14-slim

WORKDIR /usr/app

COPY front.tar.gz .

RUN tar zxf front.tar.gz

RUN mv package.deploy.json package.json

RUN npm install

RUN npm i -g ts-node

ADD https://github.com/eficode/wait-for/archive/refs/tags/v2.1.2.tar.gz .

RUN tar xvf v2.1.2.tar.gz

RUN mv ./wait-for-2.1.2/wait-for ./wait-for

EXPOSE 3333

CMD ["./wait-for", "-t", "30", "http://localhost:7000", "--", "ts-node", "bin/www.ts"]
