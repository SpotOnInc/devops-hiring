FROM python:3.5-alpine AS builder

WORKDIR /opt/app

RUN adduser -S appuser

RUN chown -R appuser /opt/app 

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 8000

FROM builder  

WORKDIR /opt/app

USER appuser

COPY --chown=appuser . .

CMD python manage.py runserver 0.0.0.0:8000