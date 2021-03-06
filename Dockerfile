# Stage 1. Build the binary
FROM golang:1.11

ENV RELEASE="0.0.1"

# add a non-privileged user
RUN useradd -u 10001 goworkshop

RUN mkdir -p /go/src/github.com/dimitardanailov/sofiagoworkshop
ADD . /go/src/github.com/dimitardanailov/sofiagoworkshop
WORKDIR /go/src/github.com/dimitardanailov/sofiagoworkshop

# build the binary with go build
RUN CGO_ENABLED=0 go build \
	-ldflags "-s -w -X github.com/dimitardanailov/sofiagoworkshop/internal/version.Version=${RELEASE}" \
	-o bin/gosofia github.com/dimitardanailov/sofiagoworkshop/cmd/gosofia

# Stage 2. Run the binary
FROM scratch

ENV PORT 8080
ENV DIAG_PORT 8585

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=0 /etc/passwd /etc/passwd
USER goworkshop

COPY --from=0 /go/src/github.com/dimitardanailov/sofiagoworkshop/bin/gosofia /gosofia

EXPOSE $DIAG_PORT
EXPOSE $PORT

CMD ["/gosofia"]