# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "appengine" {
  source        = "../../"
  common_labels = var.common_labels
  project       = var.project
  app           = var.app
  sourcezip     = var.source_zip
}
