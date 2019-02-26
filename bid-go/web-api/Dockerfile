FROM golang:alpine

RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai

WORKDIR /go/src/web_api
COPY . .
#RUN pwd

RUN go build -o web_api main.go

ARG RUN_MODE
#ENTRYPOINT ["./web_api"]
CMD ["./web_api","-e","test"]
