FROM node:14-slim

# ENV NODE_ENV=production
ENV NODE_ENV=development

WORKDIR /node

COPY package.json ./package.json

RUN npm i -g ts-node && npm i && npm cache clean --force

WORKDIR /node/app

ENV PATH /app/node_modules/.bin/:$PATH

COPY . .

CMD ["ts-node", "--project", "tsconfig-server.json", "--files", "bin/www.ts"]