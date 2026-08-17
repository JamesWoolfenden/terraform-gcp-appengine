locals {
  project = coalesce(var.project, data.google_client_config.current.project)
}
