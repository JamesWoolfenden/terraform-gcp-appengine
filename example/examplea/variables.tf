variable "project" {
  type        = string
  default     = null
  description = "The GCP project ID. Defaults to the caller's ambient gcloud/ADC project when unset."
  validation {
    condition     = var.project == null || length(var.project) > 0
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

variable "domain_name" {
  type        = string
  description = "Custom domain name mapped to the App Engine application"
  validation {
    condition     = length(var.domain_name) > 0
    error_message = "Domain name must not be empty."
  }
}

variable "allowed_source_range" {
  type        = string
  description = "CIDR range allowed to reach the App Engine application; all other traffic is denied"
  validation {
    condition     = length(var.allowed_source_range) > 0
    error_message = "Allowed source range must not be empty."
  }
}
