output "instance_id" {
  value       = google_spanner_instance.main.id
  description = "ID of the Spanner instance"
}

output "database_id" {
  value       = google_spanner_database.main.id
  description = "ID of the Spanner database"
}
