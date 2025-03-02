# django-website-template

A Django-based website template with SCSS preprocessing, Poetry for dependency management, and Docker for containerized deployment.

## Features
- **Django** – Web framework for building robust applications.
- **libsass + django-compressor** – SCSS preprocessing and asset compression.
- **Poetry** – Dependency management for Python projects.
- **Docker & Docker Compose** – Containerized development and deployment.

## Installation & Setup
### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/django-website-template.git
cd django-website-template
```

### 2. Install Dependencies with Poetry
Make sure you have Poetry installed:
```bash
pip install poetry
```
Then install project dependencies:
```bash
poetry install
```

### 3. Run the Development Server
```bash
python manage.py runserver
```
Your app should now be available at `http://127.0.0.1:8000/`

## Running with Docker
### Build and Start the Containers
```bash
docker-compose up --build
```
This will:
- Build the Docker image
- Start the Django application

### Stop Containers
```bash
docker-compose down
```

## SCSS Support
- SCSS files should be placed in `static/scss/`
- They will be processed by `libsass` and `django-compressor`
- Make sure to use `{% compress css %}` in your templates

## License
This project is licensed under the MIT License.

