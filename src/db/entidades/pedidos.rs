//! `SeaORM` Entity. Generated by sea-orm-codegen 0.12.10

use sea_orm::entity::prelude::*;
use serde::{Deserialize, Serialize};

#[derive(
    Clone, Debug, PartialEq, DeriveEntityModel, Eq, Serialize, Deserialize, poem_openapi :: Object,
)]
#[sea_orm(table_name = "Pedidos")]
pub struct Model {
    #[sea_orm(primary_key, auto_increment = false)]
    pub id: i32,
    pub cliente_id: Option<i32>,
    pub servicio_id: Option<i32>,
    pub fecha_pedido: Option<DateTimeUtc>,
    pub estado: Option<String>,
    pub created_at: Option<DateTimeUtc>,
}

#[derive(Copy, Clone, Debug, EnumIter, DeriveRelation)]
pub enum Relation {
    #[sea_orm(
        belongs_to = "super::clientes::Entity",
        from = "Column::ClienteId",
        to = "super::clientes::Column::Id",
        on_update = "Restrict",
        on_delete = "Restrict"
    )]
    Clientes,
    #[sea_orm(
        belongs_to = "super::servicios::Entity",
        from = "Column::ServicioId",
        to = "super::servicios::Column::Id",
        on_update = "Restrict",
        on_delete = "Restrict"
    )]
    Servicios,
}

impl Related<super::clientes::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Clientes.def()
    }
}

impl Related<super::servicios::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Servicios.def()
    }
}

impl ActiveModelBehavior for ActiveModel {}