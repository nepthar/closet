# These are helpful functions for working with this project. Feel free
# to copy/paste or source this file.


DK_TAG="flask-docker-2"

## Build the development docker image
build-dev() {
  docker-compose --build
}


# Run this when you want to start working on this project for a while
# up: tells it to spin everything up
# -d: Run in the background
# --build: Rebuild everything
start-development() {
  docker-compose up -d --build
}

# Run this when you're done working. It shuts everything down and cleans up.
finish-development() {

}

# Run a command in the main app (`flaskapp` service) using docker compose to
# route properly.
run-dev() {
  docker-compose exec flaskapp "$@"
}

run-dev-manage() {
  run-dev python manage.py "$@"
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
