resource "google_service_account" "app" {
  account_id   = "spanner-app"
  display_name = "Spanner application reader"
}
