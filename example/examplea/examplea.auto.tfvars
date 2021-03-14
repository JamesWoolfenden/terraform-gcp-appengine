common_tags = {
  createdby = "terraform"
module = "terraform-gcp-appengine" }
project = "examplea"
app = {
  runtime             = "python37"
  service             = "hello"
  runtime_api_version = "1"
  version_id          = "v2"
  url_regex           = "/.*"
  script_path         = "main.app"
}
sourcezip = "./code/main_test.zip"
