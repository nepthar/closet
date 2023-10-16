FROM python:3-alpine3.15
WORKDIR /app
COPY ./flaskapp /app/flaskapp
RUN apk add bash
RUN pip install -r ./flaskapp/requirements.txt
EXPOSE 8000
CMD gunicorn -w 2 -b 0.0.0.0 'flaskapp:create_app()'
