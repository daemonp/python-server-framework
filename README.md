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
- `Makefile`: This file contains commands for setting up a virtual environment, installing dependencies, running tests, and linting Python files.


## Usage

### Adding Your Code

Replace the contents of `app.py` and `test_app.py` with your own Python 
application and tests. If your application requires additional Python packages, 
add them to `requirements.txt`.

### Setting Up a Virtual Environment

This project uses a virtual environment (venv) for local development. To create 
the venv and install the necessary Python packages, use the following command 
in your terminal:

```bash
make venv
source venv/bin/activate
```

### Building and Testing Locally

You can use the Makefile commands to install dependencies, run tests, and lint 
the code. To do all of these, use the following command in your terminal:

To setup the environment: `make install`
To run the tests: `make test`
To run the pylint: `make lint`
To build the Docker image: `make docker-build`
To run the Docker image: `make docker-run`

### Building and Running Docker Locally

To build and run the Docker container for your application locally, use:

```bash
docker build -t myapp .
docker run -p 5000:5000 myapp
```
You should be able to visit http://localhost:5000 and see the app running

