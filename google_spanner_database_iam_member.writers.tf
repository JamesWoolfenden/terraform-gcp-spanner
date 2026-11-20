resource "google_spanner_database_iam_member" "writers" {
  for_each = toset(var.writers)
  instance = google_spanner_instance.main.name
  database = google_spanner_database.main.name
  role     = "roles/spanner.databaseUser"
  member   = each.value
}
