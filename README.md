# Discover Tanzania (Vue + Spring Boot + Tailwind + PostgreSQL)

This repository contains:

- **Frontend**: Vue 3 + Vite + Tailwind (`frontend/`)
- **Backend**: Spring Boot REST API + Flyway + JPA (`backend/`)
- **Database**: PostgreSQL (via `docker-compose.yml`)
- **Legacy site**: the original static HTML + images (`legacy/`)
  - The Vue dev server is configured to serve images directly from `legacy/`.

## Prerequisites

- Docker + `docker-compose`
- Java **17**
- Maven
- Node.js **20.19+** (if you don’t have Node installed, this repo includes a local Node in `tools/node/`)

## Start PostgreSQL

```bash
docker-compose up -d
```

PostgreSQL connection defaults:

- DB: `discover_tanzania`
- User: `dt_user`
- Password: `dt_pass`
- Host: `localhost:5432`

## Run the Spring Boot backend

This environment’s Maven may default to Java 11, so set Java 17 explicitly:

```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"

mvn -f backend/pom.xml spring-boot:run
```

Backend runs on `http://localhost:8080`.

### API endpoints

- `GET /api/places`
- `GET /api/places/{slug}`
- `GET /api/team`
- `GET /api/team/{id}`
- `POST /api/contact`

## Run the Vue frontend

If Node is not installed on your machine, you can use the local Node bundled here:

```bash
export PATH="$(pwd)/tools/node/bin:$PATH"
```

Then:

```bash
cd frontend
npm install
npm run dev
```

Frontend runs on `http://localhost:5173` and calls the backend at `http://localhost:8080` by default.

### Configure API base URL (optional)

Set `VITE_API_BASE_URL` if your backend runs elsewhere:

```bash
export VITE_API_BASE_URL="http://localhost:8080"
```

