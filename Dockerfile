FROM node
WORKDIR /app

RUN apt get install nginx


COPY . .
EXPOSE 3000

COPY package*.json ./

ENTRYPOINT start npm
