variable "terraform_plan_principal" {
  type        = string
  description = "IAM member (e.g. serviceAccount:...) that gets the read-only planner role. Bind this to whatever identity runs `terraform plan` on every branch."

  validation {
    condition     = trimspace(var.terraform_plan_principal) != ""
    error_message = "terraform_plan_principal must be a non-empty IAM member."
  }
}

variable "terraform_apply_principal" {
  type        = string
  description = "IAM member (e.g. serviceAccount:...) that gets the full applier role. Bind this only to the identity used on protected branches / a gated CI job."

  validation {
    condition     = trimspace(var.terraform_apply_principal) != ""
    error_message = "terraform_apply_principal must be a non-empty IAM member."
  }
}
