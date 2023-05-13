.PHONY: install lint test docker-build docker-run all clean venv

VENV_NAME?=venv
VENV_ACTIVATE=. $(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python3

venv: $(VENV_NAME)/bin/activate

$(VENV_NAME)/bin/activate: requirements.txt
	test -d $(VENV_NAME) || virtualenv -p python3 $(VENV_NAME)
	${PYTHON} -m pip install -U pip
	${PYTHON} -m pip install -r requirements.txt
	touch $(VENV_NAME)/bin/activate

lint: venv
	${PYTHON} -m pylint **/*.py

test: venv
	${PYTHON} -m pytest

docker-build: lint test
	docker build . -t myapp

docker-run:
	docker run -p 5000:5000 myapp

all: venv lint test docker-build

clean:
	rm -rf $(VENV_NAME)
	docker rmi myapp

