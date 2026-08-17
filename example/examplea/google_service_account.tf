resource "google_service_account" "appengine" {
  project      = local.project
  account_id   = "appengine-sa"
  display_name = "App Engine service account"
  description  = "Service account used to run the App Engine version for the examplea example"
}
