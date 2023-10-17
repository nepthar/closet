FROM python:3-alpine3.15
WORKDIR /app
COPY . /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN pip install -r flaskapp/requirements.txt

EXPOSE 5000
CMD gunicorn --workers=2 --bind=0.0.0.0:80 'flaskapp:app'
