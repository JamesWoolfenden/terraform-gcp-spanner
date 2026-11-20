# Database-scoped IAM grants, never project-scoped (HLD_GCP_104), and never
# allUsers/allAuthenticatedUsers (HLD_GCP_178). Readers get the read-only role;
# read-write access is an explicit, separate choice (google_spanner_database_iam_member.writers).
resource "google_spanner_database_iam_member" "readers" {
  for_each = toset(var.readers)
  instance = google_spanner_instance.main.name
  database = google_spanner_database.main.name
  role     = "roles/spanner.databaseReader"
  member   = each.value
}
