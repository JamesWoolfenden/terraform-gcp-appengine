variable "project" {
  description = "GCP Project"
  type        = string
  validation {
    condition     = length(var.project) > 0
    error_message = "Project ID must not be empty."
  }
}

variable "app" {
  description = "A map of all the service properties"
  type        = map(any)
  validation {
    condition     = can(var.app["service"])
    error_message = "The 'service' key is required in the app variable."
  }
}

variable "sourcezip" {
  type        = string
  description = "The Source zip file payload for app engine"
  validation {
    condition     = length(var.sourcezip) > 0
    error_message = "Source zip file path must not be empty."
  }
}

variable "storage_class" {
  default     = "STANDARD"
  description = "The Storage class of the bucket. Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  type        = string
  validation {
    condition     = can(regex("STANDARD|MULTI_REGIONAL|REGIONAL|NEARLINE|COLDLINE|ARCHIVE", var.storage_class))
    error_message = "Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}


variable "location" {
  type        = string
  description = "The location of the bucket"
  default     = "eu"
  validation {
    condition     = length(var.location) > 0
    error_message = "Location must not be empty."
  }
}

variable "entrypoint" {
  type        = string
  description = "app entrypoint"
  default     = "python3 ./main.py"
  validation {
    condition     = length(var.entrypoint) > 0
    error_message = "Entrypoint must not be empty."
  }
}

variable "kms_key_name" {
  type        = string
  description = "The KMS key name for encryption"
  validation {
    condition     = length(var.kms_key_name) > 0
    error_message = "KMS key name must not be empty."
  }
}

variable "service_account" {
  type        = string
  description = "Email of the service account to run the App Engine version as; must not be the App Engine default SA"
  validation {
    condition     = length(var.service_account) > 0
    error_message = "service_account must be a non-empty service account email."
  }
}

variable "versioning" {
  type        = bool
  description = "Switch for versioning"
  default     = true
  validation {
    condition     = var.versioning == true || var.versioning == false
    error_message = "Versioning must be a boolean value."
  }
}
