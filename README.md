# 🐦 Birdwatching Tracker

A REST API for recording bird observations: which species was seen, where, and when.
Built as a portfolio project to practise production-grade Spring Boot backend development.

> 🚧 **Work in progress.** Features are being added step by step. See the roadmap below.

## Tech stack

- Java 17, Spring Boot 4
- Spring Data JPA (Hibernate), PostgreSQL 17
- Flyway for database migrations
- Bean Validation (Jakarta)
- JUnit 5, Mockito, Testcontainers

## Running locally

**Requirements:** JDK 17+, a PostgreSQL database.

The app reads its database connection from environment variables:

| Variable      | Example                                         |
|---------------|-------------------------------------------------|
| `DB_URL`      | `jdbc:postgresql://localhost:5432/birdwatching` |
| `DB_USERNAME` | `birdwatching`                                  |
| `DB_PASSWORD` | `secret`                                        |

No database? Start one with Docker:

```bash
docker run -d --name birdwatching-db -p 5432:5432 \
  -e POSTGRES_DB=birdwatching -e POSTGRES_USER=birdwatching -e POSTGRES_PASSWORD=secret \
  postgres:17
```

Then run:

```bash
./mvnw spring-boot:run
```

Flyway creates the schema automatically on startup.

## Roadmap

- [ ] Database schema: species, locations, observations
- [ ] CRUD endpoints for observations (`/api/v1/observations`)
- [ ] Pagination and filtering by species
- [ ] Species statistics endpoint
- [ ] Global error handling (RFC 7807 Problem Details)
- [ ] Unit, web-layer and integration tests (Testcontainers)
- [ ] OpenAPI / Swagger UI documentation
- [ ] Actuator health and metrics
