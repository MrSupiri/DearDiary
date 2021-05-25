use crate::schema::{create_schema, Context, Schema};
use actix_web::{web, Error, HttpResponse};
use juniper::http::playground::playground_source;
use juniper::http::GraphQLRequest;

pub async fn graphql(
    schema: web::Data<Schema>,
    data: web::Json<GraphQLRequest>,
) -> Result<HttpResponse, Error> {
    let ctx = Context {};
    let res = web::block(move || {
        let res = data.execute_sync(&schema, &ctx);
        Ok::<_, serde_json::error::Error>(serde_json::to_string(&res)?)
    })
    .await
    .map_err(Error::from)?;

    Ok(HttpResponse::Ok()
        .content_type("application/json")
        .body(res))
}

pub async fn graphql_playground() -> HttpResponse {
    HttpResponse::Ok()
        .content_type("text/html; charset=utf-8")
        .body(playground_source("/graphql", None))
}

pub fn register(config: &mut web::ServiceConfig) {
    config
        .data(create_schema())
        .route("/", web::get().to(graphql_playground))
        .route("/graphql", web::post().to(graphql));
}
