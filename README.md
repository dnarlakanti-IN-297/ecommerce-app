# E-Commerce Application - 3-Tier Architecture

A modern, scalable e-commerce platform built with **true 3-tier architecture** featuring separate Flask applications for frontend and backend, with PostgreSQL database.

## 🏗️ Architecture

This is a **3-tier application** with complete separation of concerns:

```
┌─────────────────┐         ┌─────────────────┐         ┌──────────────┐
│  Tier 1         │         │  Tier 2         │         │  Tier 3      │
│  Frontend       │  HTTP   │  Backend API    │  SQL    │  Database    │
│  (Flask UI)     │────────▶│  (Flask REST)   │────────▶│  (PostgreSQL)│
│  Port: 8080     │         │  Port: 5000     │         │  Port: 5432  │
└─────────────────┘         └─────────────────┘         └──────────────┘
```

### Why 3-Tier?

- **Separate Services**: Two independent Flask applications (frontend + backend)
- **Independent Scaling**: Scale frontend (3 replicas) and backend (5 replicas) separately
- **API Reusability**: Backend REST API can serve web, mobile, and partner integrations
- **Security**: Database credentials only in backend, frontend never touches DB directly
- **Team Separation**: Frontend and backend teams can work independently

## 📁 Repository Structure

```
ecommerce-app/
├── frontend/              # Flask UI application (Tier 1)
│   ├── app.py            # Frontend Flask app
│   ├── templates/        # Jinja2 HTML templates
│   ├── Dockerfile
│   └── requirements.txt
├── backend/              # Flask REST API (Tier 2)
│   ├── app.py           # Backend API with business logic
│   ├── Dockerfile
│   └── requirements.txt
├── database/            # PostgreSQL schemas (Tier 3)
│   ├── schema.sql
│   └── seed_data.sql
├── tests/               # Test suites
├── docker-compose.yml   # Local development
└── Jenkinsfile          # CI/CD pipeline
```

## 🚀 Quick Start

### Local Development with Docker Compose

```bash
# Clone repository
git clone https://github.com/dnarlakanti-IN-297/ecommerce-app.git
cd ecommerce-app

# Start all services (3 containers)
docker-compose up -d

# Access the application
# Frontend: http://localhost:8080
# Backend API: http://localhost:5000
# Database: localhost:5432
```

### Manual Setup

**Prerequisites:**
- Python 3.11+
- PostgreSQL 15+
- Docker (optional)

**Backend Setup:**
```bash
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
export DATABASE_URL=postgresql://ecommerce:password@localhost:5432/ecommerce
flask run --port=5000
```

**Frontend Setup:**
```bash
cd frontend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
export BACKEND_URL=http://localhost:5000
flask run --port=8080
```

## 🛠️ Technology Stack

### Programming & Framework
- **Python 3.11** - Primary language
- **Flask 3.0** - Web framework (2 separate apps)
- **SQLAlchemy** - ORM for database
- **Pytest** - Testing framework

### Infrastructure
- **PostgreSQL 15** - Database (Tier 3)
- **Docker** - Containerization
- **Jenkins (OSS)** - CI/CD automation
- **Helm** - Kubernetes package manager
- **ArgoCD** - GitOps continuous delivery
- **GKE** - Google Kubernetes Engine

## 📊 Features

### Customer Features
- Product catalog with search and filters
- Shopping cart with session management
- Multi-step checkout process
- Order tracking and history
- Product reviews and ratings

### Admin Features
- Product management (CRUD operations)
- Inventory tracking
- Order processing
- Customer management

## 🔄 CI/CD Pipeline

**Jenkins Pipeline Flow:**
1. **Checkout** - Clone code from GitHub
2. **Test** - Run pytest unit tests
3. **Build** - Build Docker images for frontend and backend
4. **Push** - Push images to Docker Hub with Git SHA tags
5. **Update Manifests** - Update Helm values.yaml in infra repo
6. **Deploy** - ArgoCD detects changes and deploys to GKE

## 🌐 Deployment

### Kubernetes Namespaces

- **ecommerce-dev** - Development environment
- **ecommerce-staging** - Pre-production testing
- **ecommerce-prod** - Production environment

### Deployment Strategy

```
Code Push → GitHub → Jenkins CI → Docker Hub → Update Helm Charts → ArgoCD → GKE
```

## 🧪 Testing

```bash
# Run backend tests
cd backend
pytest tests/ -v

# Run with coverage
pytest tests/ --cov=app --cov-report=html
```

## 📝 API Documentation

### Backend REST API Endpoints

**Products:**
- `GET /api/products` - List all products
- `GET /api/products/<id>` - Get product details

**Cart:**
- `GET /api/cart` - Get cart contents
- `POST /api/cart` - Add item to cart
- `DELETE /api/cart/<product_id>` - Remove item

**Orders:**
- `POST /api/checkout` - Place order
- `GET /api/orders/<id>` - Get order details

**Health:**
- `GET /health` - Health check endpoint

## 🔐 Environment Variables

**Backend:**
- `DATABASE_URL` - PostgreSQL connection string
- `FLASK_ENV` - Flask environment (development/production)

**Frontend:**
- `BACKEND_URL` - Backend API URL
- `SECRET_KEY` - Flask session secret key

## 📦 Docker Images

- `dnarlakanti/ecommerce-frontend:latest` - Frontend application
- `dnarlakanti/ecommerce-backend:latest` - Backend API
- `postgres:15-alpine` - PostgreSQL database

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Write/update tests
5. Submit a pull request

## 📄 License

MIT License - See LICENSE file for details

## 👥 Team

Built by dnarlakanti@cloudbees.com

## 🔗 Related Repositories

- [ecommerce-infra](https://github.com/dnarlakanti-IN-297/ecommerce-infra) - Kubernetes manifests and Helm charts
