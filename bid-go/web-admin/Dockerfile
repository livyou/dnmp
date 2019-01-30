FROM golang:alpine

WORKDIR /go/src/web_admin
COPY /opt/go/web/src/web_admin .

RUN go build -o web_admin main.go

#CMD [ "./web_admin -e pro" ]