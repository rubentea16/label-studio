# The Cloud SQL postgres
resource "google_sql_database_instance" "label-studio-postgres" {
  name             = "label-studio-db"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = var.database_tier
  }
}

resource "google_sql_user" "users" {
  name     = var.database_user
  instance = google_sql_database_instance.label-studio-postgres.name
  password = var.database_password
}
