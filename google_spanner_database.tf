# deletion_protection (terraform-level) and enable_drop_protection (API-level)
# are both required — HLD_GCP_054 and HLD_GCP_247 cover the two distinct
# guard mechanisms.
resource "google_spanner_database" "main" {
  instance                 = google_spanner_instance.main.name
  name                     = var.database_name
  database_dialect         = "GOOGLE_STANDARD_SQL"
  version_retention_period = "7d"
  deletion_protection      = true
  enable_drop_protection   = true

  encryption_config {
    kms_key_name = var.kms_key_name
  }
}
