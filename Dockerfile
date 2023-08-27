FROM node:20-alpine AS deps

RUN apk update && \
    apk add --no-cache libc6-compat openssh git python3 py3-pip alpine-sdk wget

RUN npm i node-gyp -g
# RUN pip install numpy pandas datetime sklearn

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn

