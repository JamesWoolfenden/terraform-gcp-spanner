resource "google_spanner_instance" "main" {
  name                         = var.instance_name
  config                       = var.config
  display_name                 = var.instance_name
  processing_units             = var.processing_units
  default_backup_schedule_type = "AUTOMATIC"

  lifecycle {
    # Spanner rejects a database CMEK key outside a regional config's location.
    # Check it here so a mismatch fails before the instance is created rather
    # than when the database is.
    precondition {
      condition     = !startswith(var.config, "regional-") || split("/", var.kms_key_name)[3] == trimprefix(var.config, "regional-")
      error_message = "var.kms_key_name must be in the same location as the regional instance config (${trimprefix(var.config, "regional-")})."
    }
  }
}
