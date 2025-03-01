# Use an official Python runtime as the base image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    POETRY_VERSION=2.1.1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false

# Install system dependencies and Poetry
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && apt-get clean

# Add Poetry to PATH
ENV PATH="$POETRY_HOME/bin:$PATH"

# Set working directory
WORKDIR /app

# Copy Poetry files and install dependencies
COPY pyproject.toml poetry.lock* ./
RUN poetry install --no-dev  # Install runtime dependencies only

# Copy project files
COPY . .

# Collect static files (includes SCSS precompilation by django-compressor)
RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000

# Command for production
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "xristnet_django.wsgi:application"]