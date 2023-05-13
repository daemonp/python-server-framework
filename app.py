"""
Flask application to return a Hello World
"""

from flask import Flask

APP = Flask(__name__)


@APP.route('/')
def hello_world():
    """
    Return a Hello World
    """
    return 'Hello, World!'


if __name__ == '__main__':
    APP.run(debug=True, host='0.0.0.0', port=5000)
