# Status

[![Python application test with Github 
Actions](https://github.com/daemonp/python-server-framework/actions/workflows/main.yml/badge.svg)](https://github.com/daemonp/python-server-framework/actions/workflows/main.yml)

# Python Framework for a Dockerized Application Template

This project serves as a basic template for Python applications, which is 
dockerized and includes a CI/CD pipeline using GitHub Actions. This template is 
designed to help you quickly integrate your Python application into a Git 
repository and automate the process of testing, linting, and building a Docker 
container for your application.

## Prerequisites

Before you can use this template, you need to install Python, pip, virtualenv, Docker, and Make on your local machine. Here's how you can do this on Mac, Ubuntu, and Arch Linux:

### Mac

You can use Homebrew to install the necessary packages:

```bash
brew install python3
brew install pip
brew install docker
brew install make
pip install virtualenv
```

Docker Desktop for Mac installs as a standard application. To start 
Docker, you simply need to launch Docker Desktop. You can find 
Docker Desktop in your Applications folder. After Docker Desktop 
starts, you'll see a whale icon in the top status bar indicating 
that Docker is running, and accessible from a terminal.

### Linux

#### Ubuntu
You can use apt to install the necessary packages:
```bash
sudo apt-get update
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install docker.io
sudo apt-get install make
pip3 install virtualenv
```


#### Arch
```bash
sudo pacman -Syu
sudo pacman -S python
sudo pacman -S python-pip
sudo pacman -S python-virtualenv
sudo pacman -S docker
sudo pacman -S make
```

Note: To use Docker as a non-root user, you need to add your user 
to the docker group:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

```bash
sudo systemctl enable docker
sudo systemctl enable docker
```
#### Github 

On GitHub.com, navigate to the main page of the repository.

Under your repository name, click  Settings. If you cannot see the 
"Settings" tab, select the dropdown menu, then click Settings.

In the left sidebar, click  Actions, then click General.

Under "Workflow permissions", choose whether you want the GITHUB_TOKEN to have read and write access for all scopes, or just read access for the contents and packages scopes.

Click Save to apply the settings.


## Project Structure

- `app.py`: This is the main Python file that runs your application.
- `test_app.py`: This is where you would write tests for your application.
- `requirements.txt`: This file contains the Python dependencies required for your application.
- `Dockerfile`: This file is used to create a Docker container for your application.
- `.github/workflows/main.yml`: This is the GitHub Actions workflow that runs your tests, lints your Python files with pylint, and builds a Docker container for your application.
- `Makefile`: This file contains commands for setting up a virtual environment, 

## How does this all work?

GitHub Actions is a workflow automation and continuous integration/continuous 
deployment (CI/CD) platform provided by GitHub. It allows you to define custom 
workflows in your repository to automate various tasks, such as building, 
testing, and deploying your code.

In the context provided here, GitHub Actions is used to automatically lint and 
test your Python application, as well as to create a Docker container and push 
it to the GitHub Container Registry.

Whenever a commit is pushed to GitHub, the configured GitHub Actions runner 
triggers and executes the defined actions in your workflow. You can see the 
updates and build results in the Actions page of your repository.

The Actions page provides a detailed overview of your workflows and their 
execution status. You can access it at the following URL: 
https://github.com/daemonp/python-server-framework/actions

On this page, you will find a list of all the workflows that have been 
triggered by your commits. Each workflow is displayed with its name, status, 
and the commit or event that triggered it.

By clicking on a specific workflow run, you can dive into the details. The page 
provides a chronological view of the executed steps and their outcomes. You can 
inspect the logs of each step to see the output, including any error messages 
or warnings that might have occurred during the workflow run.

The Actions page also allows you to filter and search for specific workflow 
runs, making it easy to navigate and locate the information you need.

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

* To setup the environment: `make install`
* To run the tests: `make test`
* To run the pylint: `make lint`
* To build the Docker image: `make docker-build`
* To run the Docker image: `make docker-run`

### Building and Running Docker Locally

To build and run the Docker container for your application locally, use:

```bash
docker build -t myapp .
docker run -p 5000:5000 myapp
```
You should be able to visit http://localhost:5000 and see the app running


# Deploying to the internet

To set up a Kubernetes instance in DigitalOcean, you will first 
need to create a Kubernetes cluster, then set up the kubectl 
command-line tool to communicate with your cluster. After that, 
you'll need to create a Kubernetes Deployment that uses your Docker 
image. This process will be documented in a 
[deployment.md](deployment.md) file.

