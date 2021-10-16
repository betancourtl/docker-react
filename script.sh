#!/bin/bash

docker build \
  -t betancourtl/node-app:latest \
  -f Dockerfile.dev .

docker run \
  -it \
  --rm \
  -p 3000:3000 \
  -v /app/node_modules \
  -v $(pwd):/app \
  betancourtl/node-app:latest

function build-nginx() {
  docker build \
    -t betancourtl/nginx:latest \
    -f Dockerfile .
}

function nginx() {
  docker run \
    -it \
    --rm \
    -p 8080:80 \
    betancourtl/nginx:latest
}
