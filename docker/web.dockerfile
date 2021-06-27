FROM node:alpine as base

WORKDIR /usr/src/app
COPY /web/package*.json .
EXPOSE 8080

FROM base as production
ENV NODE_ENV=production
RUN npm ci
COPY web .
CMD ["npm", "start"]

FROM base as dev
ENV NODE_ENV=development
RUN npm install -g nodemon && npm install
COPY web .
CMD ["npm", "start"]