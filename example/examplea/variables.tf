variable "project" {
  type        = string
  description = "The GCP project ID"
  validation {
    condition     = length(var.project) > 0
    error_message = "Project ID must not be empty."
  }
}

variable "app" {
  type        = map(any)
  description = "Configuration for the App Engine application"
  validation {
    condition     = can(var.app["service"])
    error_message = "The 'service' key is required in the app variable."
  }
}

variable "source_zip" {
  type        = string
  description = "The Source zip file payload for app engine"
  validation {
    condition     = length(var.source_zip) > 0
    error_message = "Source zip file path must not be empty."
  }
}
