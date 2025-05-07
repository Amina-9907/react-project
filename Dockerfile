FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install 

COPY . .
RUN npm run build
RUN npm install -g http-server
EXPOSE 3000

# CMD ["npm", "start"]
CMD ["http-server", "build", "-p", "3000", "-a", "0.0.0.0"]

