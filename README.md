# PostgreSQL in custom Dockerfile with extension

Custom PostgreSQL Docker image with pre-installed monitoring extensions for query analysis and performance profiling.

## Features

- Pre-configured `pg_profile` extension (v4.8) for detailed performance analysis
- Enabled `pg_stat_statements` for SQL query statistics tracking
- Ready-to-use Docker Compose setup

## Quick Start

1. Build and start the container:
   ```bash
   docker-compose up -d
   ```

2. Connect to PostgreSQL:
   ```
   Host: localhost
   Port: 5432
   User: test_user
   Password: test_pass
   Database: test_db
   ```

3. Enable extensions in your database:
   ```sql
   CREATE EXTENSION pg_profile;
   CREATE EXTENSION dblink;
   CREATE EXTENSION pg_stat_statements;
   ```

## Configuration

- Edit `postgresql.conf` for custom PostgreSQL settings
- The container persists data in the `postgres_data` volume

## Included Extensions

- `pg_profile` - Advanced performance profiling tool
- `pg_stat_statements` - Tracks execution statistics of SQL queries
- `dblink` - Allows cross-database queries

## Maintenance

- Stop containers: `docker-compose down`
- Stop and remove volumes: `docker-compose down -v`
