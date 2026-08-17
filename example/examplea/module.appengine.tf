# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "appengine" {
  source          = "../../"
  project         = local.project
  app             = var.app
  sourcezip       = var.source_zip
  kms_key_name    = google_kms_crypto_key.appengine_key.id
  location        = "us-central1"
  versioning      = true
  storage_class   = "STANDARD"
  entrypoint      = "python3 ./main.py"
  service_account = google_service_account.appengine.email
}
