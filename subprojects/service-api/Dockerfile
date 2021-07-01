FROM node:14-slim

# ENV NODE_ENV=production
ENV NODE_ENV=development

WORKDIR /node

COPY package.json ./package.json

RUN npm i && npm i -g ts-node && npm cache clean --force

WORKDIR /node/app

ENV PATH /app/node_modules/.bin/:$PATH

COPY . .

CMD ["ts-node", "-r", "tsconfig-paths/register", "--files", "bin/www.ts"]