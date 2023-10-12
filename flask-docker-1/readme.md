# Dockerized Flask App - Real website w/database
Taken from https://flask.palletsprojects.com/en/3.0.x/tutorial/layout/

## Dev Environ Setup

### (Re)build the docker image.
This is necessary when you first begin developing or when you have just
modified requirements.txt or similar.

    # from the flask-docker-0 folder:
    $ docker build -t flask-docker-0:devel .

This will create a docker container tagged "flask-docker-0:devel" on your
local machine based on the Dockerfile.

### Run the server in development mode
To run the server to test out your current changes, use the following command:

    # from the flask-docker-0 folder:
    docker run -it -p=8000:8000 --volume=.:/app flask-docker-0:devel python3 app.py

From left to right, this tells docker to run. `-it` instructs it to run interactively
in your terminal. `-p=8000:8000` exposes port 8000 (as 8000). `--volume=.:/app` tells
docker to mount the current folder in /app in the container, which allows your flask
app to respond to your changes in real time. `flask-docker-0:devel` is how we refer
to the image that this container is based on. `python3 app.py` is the command that we
want docker to run in this image.

## Deploy
To deploy your flask app, follow the build instructions earlier with whichever tag you wish to use for production. Then push the docker image to dockerhub or a similar repository. Once there, follow the instructions of whichever service you're using to host.

    $ docker push "your-production-image:tag" ....
