FROM python:3-alpine3.15
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8000
CMD gunicorn -w 2 -b 0.0.0.0 'app:app'
