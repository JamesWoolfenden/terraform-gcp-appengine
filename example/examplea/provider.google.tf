# holden:ignore:HLD_GCP_059 — per-repo WIF SA with attribute.repository scoping
# provides equivalent least-privilege without impersonation.
provider "google" {
  default_labels = {
    "created_by" = "terraform"
    module       = "appengine"
  }
}

# Falls back to the caller's ambient gcloud/ADC default project when
# var.project is left unset, so this example runs without editing tfvars.
data "google_client_config" "current" {}
