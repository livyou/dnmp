FROM golang:alpine

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

WORKDIR /go/src/web_api
COPY . .
#RUN pwd

RUN go build -o web_api main.go

ARG RUN_MODE
#ENTRYPOINT ["./web_api"]
CMD ["./web_api","-e","test"]
