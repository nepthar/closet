FROM python:3-alpine3.15
WORKDIR /app
COPY ./flaskr /app/flaskr
RUN apk add bash
RUN pip install -r ./flaskr/requirements.txt
EXPOSE 8000
CMD gunicorn -w 2 -b 0.0.0.0 'app:flaskr'
