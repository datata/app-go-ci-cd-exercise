FROM golang:alpine AS build
WORKDIR /go/src/api
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/api cmd/geekshubs-library/main.go

FROM alpine
COPY --from=build /go/bin/api /go/bin/api
RUN chmod +x ./go/bin/api 
ENTRYPOINT ["go/bin/api"]
EXPOSE 8080