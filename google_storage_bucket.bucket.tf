resource "google_storage_bucket" "bucket" {
  #checkov:skip=CKV_GCP_29: "Ensure that Cloud Storage buckets have uniform bucket-level access enabled"
  #checkov:skip=CKV_GCP_62
  name = "${var.project}-${var.app["service"]}-static-content"
  encryption {
    default_kms_key_name = ""
  }
}

resource "google_storage_bucket_object" "object" {
  name   = basename(var.sourcezip)
  bucket = google_storage_bucket.bucket.name
  source = var.sourcezip
}
