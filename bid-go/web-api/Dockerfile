FROM golang:alpine

WORKDIR /go/src/web_api
COPY /opt/go/web/src/web_api .

RUN go build -o web_api main.go

#CMD [ "./web_api -e pro" ]