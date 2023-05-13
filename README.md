# Status

[![Python application test with Github 
Actions](https://github.com/daemonp/python-server-framework/actions/workflows/main.yml/badge.svg)](https://github.com/daemonp/python-server-framework/actions/workflows/main.yml)

# Python Framework for a Dockerized Application Template

This project serves as a basic template for Python applications, which is 
dockerized and includes a CI/CD pipeline using GitHub Actions. This template is 
designed to help you quickly integrate your Python application into a Git 
repository and automate the process of testing, linting, and building a Docker 
container for your application.

## Project Structure

- `app.py`: This is the main Python file that runs your Flask application.
- `test_app.py`: This is where you would write tests for your Flask application.
- `requirements.txt`: This file contains the Python dependencies required for your application.
- `Dockerfile`: This file is used to create a Docker container for your application.
- `.github/workflows/main.yml`: This is the GitHub Actions workflow that runs your tests, lints your Python files with pylint, and builds a Docker container for your application.

## Usage

### Adding Your Code

Replace the contents of `app.py` and `test_app.py` with your own Python 
application and tests. If your application requires additional Python packages, 
add them to `requirements.txt`.

### Building Locally

To build and run the Docker container for your application locally, use:

```bash
docker build -t myapp .
docker run -p 5000:5000 myapp
```
You should be able to visit http://localhost:5000 and see the app running

