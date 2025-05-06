# Étape 1 : Build de l'app React
FROM node:latest AS builder

FROM node:latest

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5173 3000

CMD ["npm", "run", "dev"]

