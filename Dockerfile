FROM python:3.10.14-alpine3.20

LABEL maintainer="viba.2394@gmail.com"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    adduser \
        --disabled-password \
        --no-create-home \
        app-user

ENV PATH="/py/bin:$PATH"

USER app-user