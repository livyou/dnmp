FROM golang:alpine

WORKDIR /go/src/web_api
COPY . .
#RUN pwd

RUN go build -o web_api main.go

#RUN ls -lh
#ENTRYPOINT ["./web_api"]
CMD ["./web_api","-e","test"]
