# Spanner encrypts CMEK databases through its service agent, which must be able
# to use the key before the database is created. The module takes the key ID
# from this resource so the grant is ordered ahead of the database.
resource "google_kms_crypto_key_iam_member" "spanner_service_agent" {
  crypto_key_id = google_kms_crypto_key.spanner.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.current.number}@gcp-sa-spanner.iam.gserviceaccount.com"
}
