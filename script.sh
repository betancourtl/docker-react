#!/bin/bash

function build-app() {
  docker build \
    -t betancourtluis/docker-react:latest \
    -f Dockerfile.dev .
}

function run-app() {
  docker run \
    -it \
    --rm \
    -p 3000:3000 \
    -v /app/node_modules \
    -v $(pwd):/app \
    betancourtluis/docker-react:latest
}

function test-app() {
  docker run \
    --rm \
    -p 3000:3000 \
    -v /app/node_modules \
    -v $(pwd):/app \
    -e CI=true \
    betancourtluis/docker-react:latest \
    npm run test -- --coverage
}

function build-nginx() {
  docker build \
    -t betancourtluis/nginx:latest \
    -f Dockerfile .
}

function nginx() {
  docker run \
    -it \
    --rm \
    -p 8080:80 \
    betancourtluis/nginx:latest
}
