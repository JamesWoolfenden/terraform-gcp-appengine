resource "google_app_engine_firewall_rule" "allow" {
  project      = var.project
  priority     = 1000
  action       = "ALLOW"
  source_range = var.allowed_source_range
  description  = "Allow traffic from the trusted source range."
}

resource "google_app_engine_firewall_rule" "default_deny" {
  project      = var.project
  priority     = 2147483647
  action       = "DENY"
  source_range = "*"
  description  = "Default deny-all rule; explicit allow rules are added at lower priority numbers."
}
