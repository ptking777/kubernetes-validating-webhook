FROM python:3.7.3-slim
RUN pip3 install --upgrade pip

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY ./gunicorn_config.py /app
COPY ./validate.py /app
COPY ./wsgi.py /app

EXPOSE 8080

CMD ["gunicorn","--config", "gunicorn_config.py", "wsgi:webhook"]


