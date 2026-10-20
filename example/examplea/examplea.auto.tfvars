app = {
  runtime     = "python312"
  service     = "hello"
  version_id  = "v2"
  url_regex   = "/.*"
  script_path = "auto"
}
source_zip  = "./code/main_test.zip"
domain_name = "example.com"
# RFC 5737 TEST-NET-3 — a placeholder public range reserved for
# documentation/examples. Replace with the real public CIDR(s) that should
# reach the app (App Engine firewall rules match the client's apparent
# public source IP, so a private RFC1918 range here can never match).
allowed_source_range = "203.0.113.0/24"
