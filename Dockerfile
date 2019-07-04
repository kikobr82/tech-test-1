FROM golang:1.12.6-alpine3.10 AS build

ENV GO111MODULE=on

WORKDIR /app

RUN apk update --no-cache

ADD ./ /app

RUN apk add git

RUN go build -o golang-test  .



FROM golang:1.12.6-alpine3.10

ENV GO111MODULE=on

WORKDIR /app

RUN apk update --no-cache

EXPOSE 8000

COPY --from=build /app/golang-test /app/

ENTRYPOINT ["/app/golang-test"]


