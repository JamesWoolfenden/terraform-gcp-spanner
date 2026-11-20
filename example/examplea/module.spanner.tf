# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "spanner" {
  source           = "../../"
  instance_name    = "pike-spanner"
  config           = "regional-europe-west2"
  processing_units = 100
  database_name    = "pike-db"
  kms_key_name     = google_kms_crypto_key_iam_member.spanner_service_agent.crypto_key_id
  readers = [
    "serviceAccount:${google_service_account.app.email}"
  ]
}
