FROM  golang:1.13-alpine as go-build

WORKDIR /app
RUN apk add --no-cache git make gcc musl-dev
COPY . .
RUN make install

FROM alpine:latest

WORKDIR /app
COPY --from=go-build /bin/resume /bin/resume

EXPOSE ${PORT}

CMD ["resume"]