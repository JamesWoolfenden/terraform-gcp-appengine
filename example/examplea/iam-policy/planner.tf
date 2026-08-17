# Planner role — read-only, safe for `terraform plan` on every branch.
# Flat, project-scoped: pike's floor for this repo has zero escalation-class
# permissions (checked against escalationGCP in pike's src/escalation.go), so
# there's nothing here that needs to be pulled into a separate role or bound
# more narrowly than the project. If a future resource in this module pulls
# in an escalation-class permission, `pike scan` will print a WARNING for it
# automatically (WarnEscalation, runs on every scan, no flag needed) — that's
# the trigger to split the flagged permission out into its own role applied
# outside CI, not to add it here.

resource "google_project_iam_custom_role" "pike_plan" {
  project     = "pike"
  role_id     = "terraform_pike_plan"
  title       = "terraform_pike_plan"
  description = "Read-only permissions for terraform plan on any branch."
  permissions = [
    "appengine.applications.get",
    "appengine.versions.get",
    "cloudkms.cryptoKeyVersions.list",
    "cloudkms.cryptoKeys.get",
    "cloudkms.cryptoKeys.getIamPolicy",
    "cloudkms.keyRings.get",
    "iam.serviceAccounts.get",
    "resourcemanager.projects.get",
    "storage.buckets.get",
    "storage.objects.list",
  ]
}

resource "google_project_iam_member" "pike_plan" {
  project = "pike"
  role    = google_project_iam_custom_role.pike_plan.id
  member  = var.terraform_plan_principal
}
