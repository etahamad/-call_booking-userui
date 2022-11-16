FROM node:17.9.0-alpine as build
LABEL maintainer="etahamad"
RUN useradd userui
WORKDIR /app
COPY package*.json ./
RUN npm install --production

FROM node:17.9.0-alpine
COPY . .
EXPOSE 3000
USER userui
CMD ["npm","start"]
