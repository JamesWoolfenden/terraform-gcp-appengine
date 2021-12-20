resource "google_storage_bucket" "bucket" {
  #checkov:skip= CKV_GCP_62
  name                        = local.bucket_name
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = var.versioning
  }

  storage_class = var.storage_class
  labels        = var.common_labels
}

resource "google_storage_bucket_object" "object" {
  name   = basename(var.sourcezip)
  bucket = google_storage_bucket.bucket.name
  source = var.sourcezip
}
