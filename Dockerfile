FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y python3-pip python-dev


RUN pip3 install --upgrade pip

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY ./gunicorn_config.py /app
COPY ./validate.py /app
COPY ./wsgi.py /app

EXPOSE 5000

CMD ["gunicorn","--config", "gunicorn_config.py", "wsgi:webhook"]


