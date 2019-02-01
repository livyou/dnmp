FROM golang:alpine

WORKDIR /go/src/web_admin
COPY . .
#RUN pwd

RUN go build -o web_admin main.go

ARG RUN_MODE
#ENTRYPOINT ["./web_admin"]
CMD ["./web_admin","-e","test"]
