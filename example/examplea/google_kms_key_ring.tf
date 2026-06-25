resource "google_kms_key_ring" "spanner" {
  name     = "spanner-keyring"
  location = "europe-west2"
}
