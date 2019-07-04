FROM golang:alpine AS build

ENV GO111MODULE=on

WORKDIR /app

RUN apk update --no-cache

ADD ./ /app

RUN apk add git

RUN go build -o golang-test  .



FROM golang:alpine

ENV GO111MODULE=on

WORKDIR /app

RUN apk update --no-cache

EXPOSE 8000

COPY --from=build /app/golang-test /app/

ENTRYPOINT ["/app/golang-test"]


