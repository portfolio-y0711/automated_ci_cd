FROM node:14

# ENV NODE_ENV=production
ENV NODE_ENV=development

WORKDIR /node

COPY ./package.json ./package.json

# RUN apt-get update \
#   && apt-get install -y curl

RUN npm i && npm i -g ts-node && npm cache clean --force

WORKDIR /node/app

ENV PATH /app/node_modules/.bin/:$PATH

COPY . .

CMD ["ts-node", "-r", "tsconfig-paths/register", "--files", "bin/www.ts"]
