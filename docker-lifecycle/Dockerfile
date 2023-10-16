FROM python:3-alpine3.15
WORKDIR /app
COPY ./pre-start.sh /app/pre-start.sh
COPY ./main.sh /app/main.sh
COPY ./post-end.sh /app/post-end.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN apk add bash
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/app/main.sh"]
