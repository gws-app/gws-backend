FROM golang as build-go
WORKDIR /gws
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /bin/gws .

FROM alpine:latest
RUN addgroup -S gws && adduser -S gws -G gws
USER gws
WORKDIR /home/gws
COPY --from=build-go /bin/gws ./
EXPOSE 8080
ENTRYPOINT ["./gws"]