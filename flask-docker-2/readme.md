# Dockerized Flask App - Multiple Services and docker-compose
Based on this tutorial: https://github.com/testdrivenio/flask-on-docker

This project contains a flask application that runs via gunicorn,
connects to an external postgres db, and is served through nginx. This
is a more complicated setup but should be closer to production.

## Dev Environ Setup



## Notes
Without the depends_on relationship, you'll get connection/visibility errors. It'll show up as the `flaskapp` image not being able to resolve the hostname `db`.
