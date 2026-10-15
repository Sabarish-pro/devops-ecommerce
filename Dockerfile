# Stage 1: Build application dependencies
FROM python:3.12-slim AS builder

WORKDIR /app

RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .

RUN python -m pip install --no-cache-dir --upgrade pip \
    && python -m pip install --no-cache-dir -r requirements.txt \
    && python -m pip install --no-cache-dir gunicorn \
    && test -x /opt/venv/bin/gunicorn

# Stage 2: Run automated tests
FROM builder AS test

COPY requirements-dev.txt .
RUN python -m pip install --no-cache-dir -r requirements-dev.txt

COPY app.py .
COPY templates/ ./templates/
COPY static/ ./static/
COPY tests/ ./tests/

RUN python -m pytest -v

# Stage 3: Production runtime
FROM python:3.12-slim AS runtime

RUN rm -rf /usr/local/lib/python3.12/site-packages/pip \
           /usr/local/lib/python3.12/site-packages/pip-*.dist-info \
           /usr/local/bin/pip \
           /usr/local/bin/pip3 \
           /usr/local/bin/pip3.12

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/opt/venv/bin:$PATH"

COPY --from=builder /opt/venv /opt/venv

COPY app.py .
COPY templates/ ./templates/
COPY static/ ./static/

USER 10001:10001

EXPOSE 5000

CMD ["/opt/venv/bin/gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

