output "app" {
  value       = google_app_engine_standard_app_version.examplea
  description = "The App Engine application"
}

output "code" {
  value       = google_storage_bucket_object.code_package
  description = "The code package stored in Cloud Storage"
}
