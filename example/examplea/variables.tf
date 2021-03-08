variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "project" {
  type = string
}

variable "app" {
  type = map(any)
}

variable "sourcezip" {
  type        = string
  description = "The Source zip file payload for app engine"
}
