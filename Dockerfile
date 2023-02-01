FROM python:3.10.5

WORKDIR /home/

RUN echo "testing1234"

RUN git clone https://github.com/osungy69/program.git

WORKDIR /home/program/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=program.settings.deploy && python manage.py migrate --settings=program.settings.deploy && gunicorn program.wsgi --env DJANGO_SETTINGS_MODULE=program.settings.deploy --bind 0.0.0.0:8000"]
