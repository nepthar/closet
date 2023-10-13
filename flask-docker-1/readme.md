# Dockerized Flask App - Real website w/database
Taken from https://flask.palletsprojects.com/en/3.0.x/tutorial/layout/

## Dev Environ Setup

### (Re)build the docker image.
This is necessary when you first begin developing or when you have just
modified requirements.txt or similar.

    # from the flask-docker-1 folder:
    $ docker build -t "flask-docker-1:devel" .

This will create a docker container tagged "flask-docker-1:devel" on your
local machine based on the Dockerfile.

### Run the server in development mode
To run the server to test out your current changes, use the following command:

    # from the flask-docker-1 folder:
    docker run -it -p=8000:8000 \
      --volume=./flaskr:/app/flaskr \
      --volume=${PWD}/flaskr.sqlite:app/instance/flaskr.sqlite \
      flask-docker-1:devel \
      flask --app flaskr run --host=0.0.0.0 --port=8000 --debug

You may wish to use the following function to assist with running flask commands

    dev-flask() {
       docker run -it -p=8000:8000 \
        --volume=./flaskr:/app/flaskr \
        --volume=${PWD}/flaskr.sqlite:app/instance/flaskr.sqlite \
        flask-docker-1:devel \
        flask --app flaskr "$@"
    }

which would then simplify running the devel server to this:

    $ dev-flask run --host=0.0.0.0 --port=8000 debug

## Deploy
To deploy your flask app, follow the build instructions earlier with whichever tag you wish to use for production. Then push the docker image to dockerhub or a similar repository. Once there, follow the instructions of whichever service you're using to host.

    $ docker push "your-production-image:tag" ....


... to be continued

