FROM node:alpine

WORKDIR /app

COPY . .

RUN chmod -R 777 node_modules
RUN chmod -R 777 /app/client/node_modules

EXPOSE 80 3000
