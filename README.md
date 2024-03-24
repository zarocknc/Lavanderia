# Backend peliculas

## Requisitos para despliegue
- Docker


## Requisitos para desarrollo
- docker (mysql) https://www.docker.com/products/docker-desktop/
- Rust Lang https://www.rust-lang.org/es/learn/get-started
- sea orm cli  ( Se instala con el comando `cargo install sea-orm-cli`)


## configurar proyecto para desarrollo
1. Levantar una base de datos con las tablas por defecto
   `docker compose up -d` (para parar mysql = `docker compose down`, para borrar datos = `docker compose down -v`)
2. iniciar proyecto
   `cargo run`

## modificar tablas y generar orm
`docker compose down -v`
Editar el archivo 01.sql
`docker compose up -d`

### Generar entidades para el orm.
con ser-orm-cli instalado, ejecutar el comando:
`sea-orm-cli generate entity -o src/db/entidades --with-serde both --model-extra-derives poem_openapi::Object`

## Extensiones para vscode:
- `ms-azuretools.vscode-docker`
- `tamasfe.even-better-toml`
- `rust-lang.rust-analyzer`