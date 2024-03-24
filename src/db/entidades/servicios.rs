//! `SeaORM` Entity. Generated by sea-orm-codegen 0.12.10

use sea_orm::entity::prelude::*;
use serde::{Deserialize, Serialize};

#[derive(
    Clone, Debug, PartialEq, DeriveEntityModel, Eq, Serialize, Deserialize, poem_openapi :: Object,
)]
#[sea_orm(table_name = "Servicios")]
pub struct Model {
    #[sea_orm(primary_key, auto_increment = false)]
    pub id: i32,
    pub nombre: Option<String>,
    #[sea_orm(column_type = "Text", nullable)]
    pub descripcion: Option<String>,
    #[sea_orm(column_type = "Decimal(Some((10, 0)))", nullable)]
    pub precio: Option<Decimal>,
    pub created_at: Option<DateTimeUtc>,
}

#[derive(Copy, Clone, Debug, EnumIter, DeriveRelation)]
pub enum Relation {
    #[sea_orm(has_many = "super::pedidos::Entity")]
    Pedidos,
}

impl Related<super::pedidos::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Pedidos.def()
    }
}

impl ActiveModelBehavior for ActiveModel {}
