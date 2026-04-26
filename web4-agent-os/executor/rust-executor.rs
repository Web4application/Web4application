use actix_web::{post, web, App, HttpServer, Responder};
use serde::Deserialize;

#[derive(Deserialize)]
struct Intent {
    did: String,
    action: String,
    resource: String,
}

fn rbac_check(intent: &Intent) -> bool {
    intent.resource == "api-service-v2"
}

fn execute_k8s(intent: &Intent) -> String {
    format!("Deployment created: {}", intent.resource)
}

#[post("/execute")]
async fn execute(intent: web::Json<Intent>) -> impl Responder {

    if !rbac_check(&intent) {
        return "RBAC DENIED";
    }

    execute_k8s(&intent)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().service(execute))
        .bind(("0.0.0.0", 8080))?
        .run()
        .await
}
