# Stage 1: Build the Python environment
FROM python:3.12-slim AS builder

WORKDIR /app

RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir gunicorn

# Stage 2: Runtime
FROM python:3.12-slim AS runtime

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
