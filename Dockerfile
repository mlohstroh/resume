FROM golang:1.10-stretch

WORKDIR /go/src/resume
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["resume"]