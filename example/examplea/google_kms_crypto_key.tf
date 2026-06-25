resource "google_kms_crypto_key" "spanner" {
  name            = "spanner-key"
  key_ring        = google_kms_key_ring.spanner.id
  rotation_period = "7776000s"

  lifecycle {
    prevent_destroy = true
  }
}
