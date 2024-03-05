FROM golang:1.22 AS builder

RUN CGO_ENABLED=0 go install github.com/yannh/kubeconform/cmd/kubeconform@v0.4.13
RUN curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.3.0/kustomize_v5.3.0_linux_amd64.tar.gz
RUN tar xzvf kustomize_v5.3.0_linux_amd64.tar.gz -C /go/bin/
