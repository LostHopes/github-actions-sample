import pytest
from app import create_app


@pytest.fixture(scope="session", autouse=True)
def app():
    """Create app for testing"""
    app = create_app()
    yield app