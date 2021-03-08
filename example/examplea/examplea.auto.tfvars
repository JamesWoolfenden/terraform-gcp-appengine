common_tags = {
  createdby = "terraform"
module = "terraform-gcp-appengine" }
project = "examplea"
app = {
  runtime             = "python27"
  service             = "hello"
  runtime_api_version = "1"
  version_id          = "v1"
  url_regex           = "/.*"
  script_path         = "main.app"
}
sourcezip = "./code/main_test.zip"
