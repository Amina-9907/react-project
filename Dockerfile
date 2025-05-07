FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

ENV HOST=192.168.15.115

EXPOSE 3000

CMD ["npm", "run", "dev"]
