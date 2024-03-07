FROM golang:1.22 as build

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o app app.go

FROM scratch

WORKDIR /app

COPY --from=build /app/app .

ENTRYPOINT [ "./app" ]