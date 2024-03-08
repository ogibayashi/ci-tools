FROM golang:1.22 AS builder

# kubeconform
RUN CGO_ENABLED=0 go install github.com/yannh/kubeconform/cmd/kubeconform@v0.6.4

# kustomize
RUN curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.3.0/kustomize_v5.3.0_linux_amd64.tar.gz
RUN tar xzvf kustomize_v5.3.0_linux_amd64.tar.gz -C /go/bin/

# helm
RUN cd /tmp && curl -O https://get.helm.sh/helm-v3.14.2-linux-amd64.tar.gz
RUN cd /tmp && tar xzvf helm-v3.14.2-linux-amd64.tar.gz
RUN cp /tmp/linux-amd64/helm /go/bin
RUN rm -rf /tmp/helm-*
