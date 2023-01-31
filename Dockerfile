FROM python:3.10.5

WORKDIR /home/

RUN git clone https://github.com/osungy69/program.git

WORKDIR /home/program/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install Pillow

RUN pip install Django

RUN echo "SECRET_KEY=u!b=n33(!s_5n^(*o@f9kz2odwl+468@&5f1=v^_1h04lce##e" > .env

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "program.wsgi", "--bind", "0.0.0.0:8000"]
