FROM python:3-alpine3.15
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8000
CMD gunicorn --workers=2 --bind=0.0.0.0:80 'app:app'
