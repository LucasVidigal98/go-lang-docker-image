FROM golang:alpine as build

WORKDIR /go/src/

COPY ./src .

RUN go build -o hello hello-world.go

FROM scratch

WORKDIR /go/src/

COPY --from=build /go/src/ .

CMD ["./hello"]