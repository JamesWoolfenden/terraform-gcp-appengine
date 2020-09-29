resource "google_storage_bucket" "bucket" {
  name = "${var.project}-${var.app["service"]}-static-content"
  encryption {
    default_kms_key_name = ""
  }
  bucket_policy_only = true
}

resource "google_storage_bucket_object" "object" {
  name   = basename(var.sourcezip)
  bucket = google_storage_bucket.bucket.name
  source = var.sourcezip
}
