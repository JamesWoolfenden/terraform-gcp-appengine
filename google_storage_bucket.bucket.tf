resource "google_storage_bucket" "bucket" {
  #checkov:skip= CKV_GCP_62
  name = local.bucket_name
  encryption {
    default_kms_key_name = var.kms_key.name
  }

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

variable "storage_class" {
  default = "STANDARD"
  validation {
    condition     = can(regex("STANDARD|MULTI_REGIONAL|REGIONAL|NEARLINE|COLDLINE|ARCHIVE", var.storage_class))
    error_message = "Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}

variable "versioning" {
  type        = bool
  description = "Switch for versioning"
  default     = true
}
