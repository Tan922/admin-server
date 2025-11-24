# Admin Server

This service provides Spring Boot Admin server for monitoring other
microservices.

## Features

-   Spring Boot Admin UI
-   Service discovery via Docker networking
-   Supports Actuator endpoints
-   Health checks, metrics, logs

## Running

Use docker-compose:

``` bash
docker compose up -d --build admin-server
```

Access UI at `http://localhost:8081`.

## Configuration

-   Application config in `application.yml`
-   Exposes management endpoints for monitoring

## Docker

Multi-stage build for efficient image.
