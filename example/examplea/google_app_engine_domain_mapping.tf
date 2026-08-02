resource "google_app_engine_domain_mapping" "examplea" {
  project     = var.project
  domain_name = var.domain_name

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
