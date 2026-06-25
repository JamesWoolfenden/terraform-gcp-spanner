resource "google_spanner_instance" "main" {
  name                         = var.instance_name
  config                       = var.config
  display_name                 = var.instance_name
  processing_units             = var.processing_units
  default_backup_schedule_type = "AUTOMATIC"
}
