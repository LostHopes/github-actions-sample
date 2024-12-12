FROM python:slim AS hello_world

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

ENV VIRTUAL_ENV=/app/.env
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python -m venv $VIRTUAL_ENV && \
    pip install --upgrade pip \
    && pip install poetry && \
    poetry config virtualenvs.path "$VIRTUAL_ENV" && \
    poetry install --only main

COPY . /app/

EXPOSE 5000

WORKDIR /app/src

CMD [ "python", "run.py" ]