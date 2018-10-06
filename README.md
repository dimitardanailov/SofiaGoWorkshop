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
go init
go mod tidy
go mod vendor
go run ${custom.go}
```

## live example

Live example: https://services.k8s.community/dimitardanailov/gosofia