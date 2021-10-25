FROM node:14-alpine as build
WORKDIR /app
COPY ["trank/package.json","trank/"]
COPY ["trank/package-lock.json","trank/"]
WORKDIR /app/trank
RUN npm install
COPY . /app
RUN npm run build


FROM nginx
RUN mkdir /app
COPY --from=build /app/trank/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80