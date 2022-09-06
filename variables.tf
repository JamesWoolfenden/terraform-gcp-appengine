variable "common_labels" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "project" {
  description = "GCP Project"
  type        = string
}

variable "app" {
  description = "A map of all the service properties"
  type        = map(any)
}

variable "sourcezip" {
  type        = string
  description = "The Source zip file payload for app engine"
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

variable "location" {
  type    = string
  default = "eu"
}

variable "entrypoint" {
  type        = string
  description = "app entrypoint"
  default     = "python3 ./main.py"
}
