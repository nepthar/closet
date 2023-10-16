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
    --volume=./flaskapp:/app/flaskapp \
    --volume=${PWD}/flaskapp.sqlite:/app/instance/flaskapp.sqlite \
    "${DK_TAG}:devel" "$@"
}

# Run the development server
run-dev() {
  run-dev-image flask --app flaskapp run --host=0.0.0.0 --port=8000 --debug
}

# This build command assumes you're on macos and wish to build an amd64
# version of your image to push to a cloud provider.
build-prod-image() {
  if [[ -z $1 ]]; then
    echo "Supply the tag for image"
    return 1
  fi

  docker buildx build --platform=linux/amd64 -t "${1}" .
}
