FROM node:14-alpine as build

WORKDIR /app
COPY . .
WORKDIR /app/trank
RUN npm install && npm run build

FROM nginx
RUN mkdir /app
COPY --from=build /app/trank/dist /app
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80