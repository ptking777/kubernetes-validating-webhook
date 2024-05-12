FROM ubuntu:22.04

RUN apt update -y && \
    apt install -y python3-dev && \
    apt install -y python3-pip 

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip  install -r requirements.txt

COPY validate.py /app

COPY wsgi.py /app

CMD gunicorn --certfile=/certs/webhook.crt --keyfile=/certs/webhook.key --bind 0.0.0.0:443 wsgi:webhook
