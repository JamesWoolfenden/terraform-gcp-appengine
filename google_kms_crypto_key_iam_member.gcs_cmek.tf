data "google_storage_project_service_account" "gcs_account" {
  project = var.project
}

resource "google_kms_crypto_key_iam_member" "gcs_cmek" {
  crypto_key_id = var.kms_key_name
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"
}
