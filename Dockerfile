FROM ubuntu:24.04

RUN apt update -y && \
    apt install -y python3 && \
    apt install -y python3-pip python3-dev

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip3 install -r /app/requirements.txt

COPY validate.py /app

COPY wsgi.py /app

CMD gunicorn --certfile=/certs/webhook.crt --keyfile=/certs/webhook.key --bind 0.0.0.0:443 wsgi:webhook
