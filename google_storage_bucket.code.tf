resource "google_storage_bucket" "code" {
  name                        = local.bucket_name
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = var.versioning
  }

  # Bound storage growth
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  storage_class            = var.storage_class
  public_access_prevention = "enforced"

  # Require CMEK for bucket objects
  encryption {
    default_kms_key_name = var.kms_key_name
  }

  # Soft delete retention: at least 7 days (604800 seconds)
  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  # Enable access logging
  logging {
    log_bucket        = google_storage_bucket.logs.name
    log_object_prefix = "${local.bucket_name}-logs/"
  }

  depends_on = [google_kms_crypto_key_iam_member.gcs_cmek]
}

resource "google_storage_bucket_object" "code_package" {
  name         = basename(var.sourcezip)
  bucket       = google_storage_bucket.code.name
  source       = var.sourcezip
  kms_key_name = var.kms_key_name

  depends_on = [google_kms_crypto_key_iam_member.gcs_cmek]
}


# holden:ignore:HLD_GCP_003: its a log bucket
# holden:ignore:HLD_GCP_385: its a log bucket
resource "google_storage_bucket" "logs" {
  name                        = "${local.bucket_name}-logs"
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  # Bound storage growth for logs bucket
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  encryption {
    default_kms_key_name = var.kms_key_name
  }

  depends_on = [google_kms_crypto_key_iam_member.gcs_cmek]
}
