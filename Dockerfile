FROM  golang:1.18-alpine as go-build

WORKDIR /app
RUN apk add --no-cache git make gcc musl-dev
COPY . .
RUN make install

FROM alpine:latest

WORKDIR /app
COPY --from=go-build /bin/resume /bin/resume
COPY public public

EXPOSE ${PORT}

CMD ["resume"]