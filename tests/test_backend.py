import pytest
from backend.app import app, db

@pytest.fixture
def client():
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'

    with app.test_client() as client:
        with app.app_context():
            db.create_all()
        yield client

def test_health_endpoint(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json['status'] == 'healthy'

def test_get_products(client):
    response = client.get('/api/products')
    assert response.status_code == 200
    assert isinstance(response.json, list)

def test_get_cart(client):
    response = client.get('/api/cart', headers={'X-Session-ID': 'test-session'})
    assert response.status_code == 200
    assert 'items' in response.json
    assert 'total' in response.json
