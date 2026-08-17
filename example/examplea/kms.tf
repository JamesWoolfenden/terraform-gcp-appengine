resource "google_kms_crypto_key" "appengine_key" {
  name            = "appengine-key"
  key_ring        = google_kms_key_ring.appengine.id
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_key_ring" "appengine" {
  name     = "appengine"
  project  = local.project
  location = "us-central1"
}

# The CMEK service-agent grant for this key now lives inside the appengine
# module itself (google_kms_crypto_key_iam_member.gcs_cmek), since the
# module is what actually requires it -- see
# google_kms_crypto_key_iam_member.gcs_cmek.tf in the module root.
