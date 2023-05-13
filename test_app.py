"""
Unit test for app.py
"""

import pytest
import app


def test_hello_world():
    """
    Test hello_world function
    """
    assert app.hello_world() == "Hello, World!"
