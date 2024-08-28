# Stage 1: Build the application
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Stage 2: Serve the application
FROM nginx:alpine

COPY --from=build /app/dist/material-pro-angular-lite /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
