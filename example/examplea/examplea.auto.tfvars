project = "pike"
app = {
  runtime             = "python37"
  service             = "hello"
  runtime_api_version = "1"
  version_id          = "v2"
  url_regex           = "/.*"
  script_path         = "main.app"
}
source_zip           = "./code/main_test.zip"
domain_name          = "example.com"
allowed_source_range = "10.0.0.0/8"
