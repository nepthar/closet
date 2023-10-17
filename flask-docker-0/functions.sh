# These are helpful functions for working with this project. Feel free
# to copy/paste or source this file.

DK_TAG="flask-docker-0"
AWS_REGION=us-east-2
AWS_LIGHTSAIL_SERVICE="flask-docker-0"

build-dev-image() {
  docker build -t "${DK_TAG}:devel" .
}

run-dev-image() {
  docker run -it -p=8000:8000 --volume=.:/app "${DK_TAG}:devel" python3 flaskapp.py
}

build-prod-image() {
  if [[ -z $1 ]] then
    echo "Supply the tag for image"
    return 1
  fi

  echo "Building a linux/amd64 image for prod"
  docker buildx build --platform=linux/amd64 -t "${1}" .
}

push-prod-image() {
   if [[ -z $1 ]]; then
    echo "Supply the tag for the image"
    return 1
  fi

  # #aws lightsail push-container-image
  #   --region <Region>
  #   --service-name <ContainerServiceName>
  #   --label <ContainerImageLabel>
  #   --image <LocalContainerImageName>:<ImageTag>

  aws lightsail push-container-image \
    --region "$AWS_REGION" \
    --service-name "$AWS_LIGHTSAIL_SERVICE" \
    --label "flaskapp" \
    --image "$1"

}
