# Stage 1. Build the binary
FROM golang:1.11

# add a non-privileged user
RUN useradd -u 10001 goworkshop

RUN mkdir -p /go/src/github.com/dimitardanailov/SofiaGoWorkshop
ADD . /go/src/github.com/dimitardanailov/SofiaGoWorkshop
WORKDIR /go/src/github.com/dimitardanailov/SofiaGoWorkshop

# build the binary with go build
RUN CGO_ENABLED=0 go build \
	-o bin/gosofia github.com/dimitardanailov/SofiaGoWorkshop/cmd/gosofia

# Stage 2. Run the binary
FROM scratch

ENV PORT 8080
ENV DIAG_PORT 8585

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=0 /etc/passwd /etc/passwd
USER goworkshop

COPY --from=0 /go/src/github.com/dimitardanailov/SofiaGoWorkshop/bin/gosofia /gosofia

EXPOSE $DIAG_PORT
EXPOSE $PORT

CMD ["/gosofia"]