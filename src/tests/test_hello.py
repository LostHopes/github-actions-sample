import pytest
from tests import app

@pytest.fixture
def client(app: app):
    """Test client for an app"""
    with app.test_client() as client:
        yield client

def test_hello_world(client: client):
    response = client.get("/")
    assert response.status_code == 200
    assert "Hello, World!" in response.get_data(as_text=True)