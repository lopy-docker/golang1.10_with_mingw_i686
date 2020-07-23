FROM debian:10-slim

ENV GOPATH=/go
ENV CXX=i686-w64-mingw32-g++-win32
ENV CC=i686-w64-mingw32-gcc-win32
ENV CGO_ENABLED=1
ENV GOOS=windows
ENV GOARCH=386

RUN mkdir /tmp -p \
    && mkdir /go -p \
    && cd /tmp \
    && apt update \
    && apt install git wget g++-mingw-w64-i686 -y \
    && wget https://golang.org/dl/go1.10.8.linux-amd64.tar.gz \
    && tar -zxvf go1.10.8.linux-amd64.tar.gz \
    && mv go /usr/local/ \
    && export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH \
    && rm -rf /tmp/* \
    && apt clean && apt autoclean \
    && rm -rf /var/cache/apt/*
