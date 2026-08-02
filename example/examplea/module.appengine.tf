# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "appengine" {
  source          = "../../"
  project         = var.project
  app             = var.app
  sourcezip       = var.source_zip
  kms_key_name    = google_kms_crypto_key.appengine_key.id
  location        = "us-central1"
  versioning      = true
  storage_class   = "STANDARD"
  entrypoint      = "python3 ./main.py"
  service_account = google_service_account.appengine.email
}

resource "google_service_account" "appengine" {
  project      = var.project
  account_id   = "appengine-sa"
  display_name = "App Engine service account"
  description  = "Service account used to run the App Engine version for the examplea example"
}


resource "google_kms_crypto_key" "appengine_key" {
  name            = "appengine-key"
  key_ring        = google_kms_key_ring.appengine.id
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_key_ring" "appengine" {
  name     = "appengine"
  project  = var.project
  location = "us-central1"
}

data "google_project" "current" {}

resource "google_kms_crypto_key_iam_member" "gcs_cmek" {
  crypto_key_id = google_kms_crypto_key.appengine_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.current.number}@gs-project-accounts.iam.gserviceaccount.com"
}
