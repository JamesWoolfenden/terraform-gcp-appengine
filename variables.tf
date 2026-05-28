variable "common_labels" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
  validation {
    condition     = length(var.common_labels) > 0
    error_message = "Common labels must not be empty."
  }
}

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

variable "versioning" {
  type        = bool
  description = "Switch for versioning"
  default     = true
  validation {
    condition     = var.versioning == true || var.versioning == false
    error_message = "Versioning must be a boolean value."
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
