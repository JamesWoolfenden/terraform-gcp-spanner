# Database-scoped IAM grants, never project-scoped (HLD_GCP_104), and never
# allUsers/allAuthenticatedUsers (HLD_GCP_178).
resource "google_spanner_database_iam_member" "readers" {
  for_each = toset(var.readers)
  instance = google_spanner_instance.main.name
  database = google_spanner_database.main.name
  role     = "roles/spanner.databaseUser"
  member   = each.value
}
