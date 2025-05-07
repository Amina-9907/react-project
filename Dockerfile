FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Build de l'app React (via Webpack ou CRA)
RUN npm run build

# http-server servira le build
EXPOSE 3000
CMD ["npm", "start"]







# Build Stage
#FROM node:18-alpine AS builder
#WORKDIR /app
#COPY package*.json ./
#RUN npm install
#COPY . .
#RUN npm run build

#RUN ls -al /app/build
# Production Stage
#FROM nginx:stable-alpine AS production

#COPY --from=builder /app/build /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
