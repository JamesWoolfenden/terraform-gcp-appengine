resource "google_storage_bucket" "code" {
  #checkov:skip= CKV_GCP_62
  name                        = local.bucket_name
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = var.versioning
  }

  storage_class            = var.storage_class
  public_access_prevention = "enforced"

  # Require CMEK for bucket objects
  encryption {
    default_kms_key_name = var.kms_key_name
  }

  # Enable access logging
  logging {
    log_bucket        = google_storage_bucket.logs.name
    log_object_prefix = "${local.bucket_name}-logs/"
  }
}

resource "google_storage_bucket_object" "code_package" {
  name   = basename(var.sourcezip)
  bucket = google_storage_bucket.code.name
  source = var.sourcezip
}


# holden:ignore:HLD_GCP_003
resource "google_storage_bucket" "logs" {
  #checkov:skip=CKV_GCP_62:logging buckets do not log themselves
  name                        = "${local.bucket_name}-logs"
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = var.kms_key_name
  }
}
