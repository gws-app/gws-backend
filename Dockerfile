FROM golang:1.23 AS build
WORKDIR /app

# Copy go.mod and go.sum first for caching dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build the Go binary with static linking
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Use a smaller base image for production
FROM gcr.io/distroless/static
WORKDIR /app

# Copy the binary and required files
COPY --from=build /app/main .
COPY --from=build /app/svac.json .
COPY .env .

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["./main"]