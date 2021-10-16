#!/bin/bash

# DEV
function build-dev-app() {
  docker build \
    -t betancourtluis/docker-react-dev:latest \
    -f Dockerfile.dev .
}

function run-dev-app() {
  docker run \
    -it \
    --rm \
    -p 3000:3000 \
    -v /app/node_modules \
    -v $(pwd):/app \
    betancourtluis/docker-react-dev:latest
}

# PROD
function build-prod-app() {
  docker build \
    -t betancourtluis/docker-react-prod:latest \
    -f Dockerfile .
}

function run-prod-app() {
  docker run \
    -it \
    --rm \
    -p 80:80 \
    -v /app/node_modules \
    -v $(pwd):/app \
    betancourtluis/docker-react-prod:latest
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
