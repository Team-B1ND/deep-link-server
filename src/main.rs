use actix_files::Files;
use actix_web::{App, HttpServer};


#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new().service(
            Files::new("/.well-known", "./.well-known")
                .prefer_utf8(true)
                .use_last_modified(true),
        )
    })
        .bind("0.0.0.0:9090")?
        .run()
        .await
}