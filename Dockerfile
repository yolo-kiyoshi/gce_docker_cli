FROM python:3.7-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY ./ ./
RUN pip install pipenv \
 && pipenv install --system

WORKDIR /app/src

CMD python main.py