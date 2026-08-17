# Applier role — full permissions for `terraform apply`, restricted to a
# gated role/protected branch. Flat, project-scoped, same reasoning as
# planner.tf: nothing in pike's floor for this repo is escalation-class, so
# there's no permission that needs to live outside this role today. Watch
# `pike scan`'s automatic WarnEscalation output over time — if this module
# grows to need an escalation-class permission, that's the signal to move
# just that permission to a separate, manually-applied role rather than
# adding it here.

resource "google_project_iam_custom_role" "pike_apply" {
  project     = "pike"
  role_id     = "terraform_pike_apply"
  title       = "terraform_pike_apply"
  description = "Full permissions for terraform apply, restricted to a gated role/protected branch."
  permissions = [
    "appengine.applications.get",
    "appengine.applications.update",
    "appengine.versions.create",
    "appengine.versions.delete",
    "appengine.versions.get",
    "appengine.versions.update",
    "cloudkms.cryptoKeyVersions.destroy",
    "cloudkms.cryptoKeyVersions.list",
    "cloudkms.cryptoKeys.create",
    "cloudkms.cryptoKeys.get",
    "cloudkms.cryptoKeys.getIamPolicy",
    "cloudkms.cryptoKeys.setIamPolicy",
    "cloudkms.cryptoKeys.update",
    "cloudkms.keyRings.create",
    "cloudkms.keyRings.get",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.update",
    "resourcemanager.projects.get",
    "storage.buckets.create",
    "storage.buckets.delete",
    "storage.buckets.get",
    "storage.buckets.update",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.list",
  ]
}

resource "google_project_iam_member" "pike_apply" {
  project = "pike"
  role    = google_project_iam_custom_role.pike_apply.id
  member  = var.terraform_apply_principal
}
