FROM node:20 AS build
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm ci --omit=dev

COPY . /app

FROM gcr.io/distroless/nodejs20-debian12

EXPOSE 3001

COPY --from=build /app /app
WORKDIR /app
CMD ["app.js"]
