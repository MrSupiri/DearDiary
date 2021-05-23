#[macro_use]
extern crate juniper;
extern crate serde_json;

use actix_web::{middleware, web, App, HttpServer};

use crate::handlers::register;

mod handlers;
mod schemas;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    // dotenv::dotenv().ok();
    std::env::set_var("RUST_LOG", "actix_web=info,info");
    env_logger::init();

    HttpServer::new(move || {
        App::new()
            .wrap(middleware::Logger::default())
            .configure(register)
            .default_service(web::to(|| async { "404" }))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
