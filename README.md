# Sofia Go Workshop

## yaml configurations

```bash
kubectl apply -f app.yaml
```

Please remember your `spec.rules.http.paths.path`

Open your terminal and type: `https://services.k8s.community/${spec.rules.http.paths.path}`

## go commands

```bash
go version

export GO111MODULE=on
go mod init
go mod tidy
go mod vendor
```

Run an application: `go run ${custom.go}`

Get a custom module: 

```bash
go get -u -v github.com/gorilla/mux
```

## live example

Live example: https://services.k8s.community/dimitardanailov/gosofia