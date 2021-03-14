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

variable "kms_key" {}
