# These are helpful functions for working with this project. Feel free
# to copy/paste or source this file.


DK_TAG="flask-docker-1"

## Build the development docker image
build-dev-image() {
  docker build -t "${DK_TAG}:devel" .
}

# There is a gotchya here: When specifying a single file as a volume, we
# have to specify ABSOLUTE paths. I don't know why.
# Also, in this situation, you have to supply what you want to do to the
# entrypoint script
run-dev-image() {
  docker run -it -p8000:8000 \
    --volume=./flaskr:/app/flaskr \
    --volume=${PWD}/flaskr.sqlite:/app/instance/flaskr.sqlite \
    "${DK_TAG}:devel" "$@"
}

# Run the development server
run-dev() {
  run-dev-image flask --app flaskr run --host=0.0.0.0 --port=8000 --debug
}

build-prod-image() {
  if [[ -z $1 ]]; then
    echo "Supply the tag for image"
    return 1
  fi

  docker buildx build --platform=linux/amd64 -t "${1}" .
}
