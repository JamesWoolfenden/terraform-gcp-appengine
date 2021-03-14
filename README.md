# terraform-gcp-appengine

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-appengine/workflows/Bump%20version/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-appengine)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-appengine.svg)](https://github.com/JamesWoolfenden/terraform-gcp-appengine/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-appengine.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-appengine/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-gcp-appengine/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-appengine&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-appengine/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-appengine&benchmark=INFRASTRUCTURE+SECURITY)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-appengine/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-appengine&benchmark=CIS+GCP+V1.1)

A working Appengine module with example.

## Usage

Add **module.appengine.tf** to your code:-

```terraform
{
    source      ="jameswoolfenden/appengine/gcp"
    version     = "0.0.4"
    common_tags = var.common_tags
    project     = var.project
    app         = var.app
    sourcezip   = var.sourcezip
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google_app_engine_standard_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_standard_app_version) |
| [google_storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) |
| [google_storage_bucket_object](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app | A map of all the service properties | `map(any)` | n/a | yes |
| common\_labels | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| kms\_key | n/a | `any` | n/a | yes |
| project | GCP Project | `string` | n/a | yes |
| sourcezip | The Source zip file payload for app engine | `string` | n/a | yes |
| storage\_class | n/a | `string` | `"STANDARD"` | no |
| versioning | Switch for versioning | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| app | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-gcp-appengine/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-gcp-appengine/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-gcp-appengine&url=https://github.com/jameswoolfenden/terraform-gcp-appengine
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-gcp-appengine&url=https://github.com/jameswoolfenden/terraform-gcp-appengine
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-gcp-appengine
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-gcp-appengine
[share_email]: mailto:?subject=terraform-gcp-appengine&body=https://github.com/jameswoolfenden/terraform-gcp-appengine

Notes

```cli
gcloud components install app-engine-python
Example sourced from:
git clone https://github.com/GoogleCloudPlatform/python-docs-samples
.\appengine\standard\hello_world\
gcloud app deploy .\app.yaml
enable api
https://console.developers.google.com/apis/api/appengine.googleapis.com/overview?project=756760134552
Ensure you have adequate permission with App Engine.
```
