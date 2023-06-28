FROM golang AS builder
WORKDIR /app
COPY go.* ./

RUN go mod download

COPY *.go ./
RUN go build -o /hello_go

FROM scratch
WORKDIR /
COPY --from=builder /hello_go /hello_go

EXPOSE 8080
ENTRYPOINT ["/hello_go"]