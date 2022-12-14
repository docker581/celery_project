FROM python:3.8.10

WORKDIR /code

ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN pip install -r /code/requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput
CMD gunicorn project.wsgi:application --bind 0.0.0.0:8000