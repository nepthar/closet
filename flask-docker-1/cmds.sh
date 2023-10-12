#!/usr/bin/env bash

# All of these are prefixed with fd1 for some command matching magic
# These are the common operations that you will need to do in this
# project

DK_TAG="flask-docker-1"

## Build the development docker image
fd1.build-dev() {
  docker build -t "${DK_TAG}:devel" .
}


# There is a gotchya here: When specifying a single file as a volume, we
# have to specify ABSOLUTE paths. I don't know why.
# Also, in this situation, you have to supply what you want to do to the
# entrypoint script
fd1.run-dev-image() {
  docker run -it -p8000:8000 \
    --volume=./flaskr:/app/flaskr \
    --volume=${PWD}/flaskr.sqlite:/app/instance/flaskr.sqlite \
    "${DK_TAG}:devel" "$@"
}

fd1.run-dev() {
  fd1.run-dev-image run --host=0.0.0.0 --port=8000 --debug
}

if [[ ! -z $1 ]]; then
  cmd=fd1.${1}
  shift 1
  $cmd "$@"
fi
