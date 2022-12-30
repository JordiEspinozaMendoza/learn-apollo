FROM node:14-alpine

EXPOSE 5001

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /app && chown node:node /app

USER node

WORKDIR /app
COPY package.json ./
RUN npm i --no-optional && npm cache clean --force

ENV PATH=/app/node_modules/.bin:$PATH

WORKDIR /app/node_app

CMD ["npm", "run", "start"]