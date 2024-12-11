FROM golang:alpine AS build
WORKDIR /go/bin
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
COPY --from=build /go/bin/go-scratch /go/bin/go-scratch
ENTRYPOINT [ "/go/bin/go-scratch" ]
EXPOSE 9000

