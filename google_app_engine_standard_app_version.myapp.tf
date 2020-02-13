resource "google_app_engine_standard_app_version" "myapp" {

  handlers {
    url_regex = var.app["url_regex"]
    script {
      script_path = var.app["script_path"]
    }
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  project             = var.project
  runtime             = var.app["runtime"]
  runtime_api_version = var.app["runtime_api_version"]
  service             = var.app["service"]
  version_id          = var.app["version_id"]

  noop_on_destroy = false
}
