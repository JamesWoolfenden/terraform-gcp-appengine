resource "google_kms_key_ring" "keyring" {
  name     = "keyring-examplea"
  location = "global"
}

resource "google_kms_crypto_key" "examplea-key" {
  name            = "crypto-key-examplea"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
}
