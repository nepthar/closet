#!/usr/bin/env bash

# All of these are prefixed with fd0 for some command matching magic

DK_TAG="flask-docker-0"

fd0.build-dev() {
  docker build -t "${DK_TAG}:devel" .
}

fd0.run-dev() {
  docker run -it -p=8000:8000 --volume=.:/app "${DK_TAG}/devel" python3 app.py
}

fd0.build-prod() {
  if [[ -z $1 ]]; then;
    echo "Supply the tag for the push command"
    return 1
  fi

  echo "Building a linux/amd64 image for prod"
  docker buildx build --platform=linux/amd64 -t "${1}" .
}

fd0.push-prod() {
   if [[ -z $1 ]]; then;
    echo "Supply the tag for the push command"
    return 1
  fi

  docker push "${1}"
}

if [[ ! -z $1 ]]; then
  fd0.${1}
fi
