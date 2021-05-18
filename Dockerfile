FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm@7.13.0
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
