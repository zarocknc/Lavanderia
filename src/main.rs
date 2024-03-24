use std::env;

use dotenv::dotenv;
use poem::{listener::TcpListener, Result, Route, Server};
use poem::error::InternalServerError;
use poem_openapi::{Object, OpenApi, OpenApiService};
use poem_openapi::payload::Json;
use sea_orm::{Database, EntityTrait};
use serde::Deserialize;

use crate::db::entidades::{pedidos, servicios};
use crate::db::entidades::prelude::Servicios;

mod db;

struct Api;

#[derive(Object, Deserialize)]
struct PedidosRequest {
    idCliente: u32,
}

#[OpenApi]
impl Api {
    /// Obtener Servicios
    #[oai(path = "/", method = "get")]
    async fn index(&self) -> Result<Json<Vec<servicios::Model>>> {
        let db_url = env::var("DATABASE_URL").expect("DBURL not set in .env file");
        let db = Database::connect(db_url).await.expect("fallo al conectar db");
        let servicios = Servicios::find().all(&db).await.map_err(InternalServerError)?;
        Ok(Json(servicios))
    }
    /// Listar pedidos de cliente
    #[oai(path = "/pedidos", method = "post")]
    async fn pedidos(&self, request_body: Json<PedidosRequest>) -> Result<Json<Vec<pedidos::Model>>> {

    }
}

#[tokio::main]
async fn main() {
    dotenv().ok();
    let api_service =
        OpenApiService::new(Api, "Lavanderia El Pepe", "1.0").server("http://localhost:3000");
    let ui = api_service.swagger_ui();
    let app = Route::new().nest("/", api_service).nest("/docs", ui);

    Server::new(TcpListener::bind("127.0.0.1:3000"))
        .run(app)
        .await.expect("Error al Inicial TCP Listener");
}