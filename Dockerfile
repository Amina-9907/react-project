#FROM node:18

#WORKDIR /app

#COPY package*.json ./
#RUN npm install 

#COPY . .
#RUN npm run build

#EXPOSE 3000

"CMD ["npm", "start"]
# Dockerfile.prod

# Étape 1 : Build React
FROM node:18 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Étape 2 : Serveur http statique
FROM node:18-slim

WORKDIR /app

# Installer un serveur statique
RUN npm install -g http-server

# Copier le build React
COPY --from=builder /app/build ./build

# Exposer le port du serveur
EXPOSE 3000

# Servir le build avec http-server
CMD ["http-server", "build", "-p", "3000", "-a", "0.0.0.0"]

