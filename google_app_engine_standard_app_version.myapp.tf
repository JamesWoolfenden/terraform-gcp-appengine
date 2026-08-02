resource "google_app_engine_standard_app_version" "examplea" {

  handlers {
    url_regex = var.app["url_regex"]
    login     = lookup(var.app, "login", "LOGIN_REQUIRED")
    script {
      script_path = lookup(var.app, "script_path", "auto")
    }
  }

  entrypoint {
    shell = var.entrypoint
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.code.name}/${google_storage_bucket_object.code_package.name}"
    }
  }

  project             = var.project
  runtime             = var.app["runtime"]
  runtime_api_version = lookup(var.app, "runtime_api_version", null)
  service             = var.app["service"]
  version_id          = var.app["version_id"]
  service_account     = var.service_account

  noop_on_destroy = false
}
