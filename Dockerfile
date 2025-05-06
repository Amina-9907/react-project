# Étape 1 : Build de l'app React
FROM node:latest AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
#RUN npm run build

RUN npm run setup
RUN npm run dev

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
