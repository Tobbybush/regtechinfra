FROM hashicorp/terraform:1.5.2

RUN apk add --no-cache \
    curl \
    bash \
    git \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && mv kubectl /usr/local/bin/kubectl

WORKDIR /regtech-app

COPY . .

CMD ["/bin/bash"]
