
# terraform-gcp-appengine

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-appengine/workflows/Bump%20version/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-appengine)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-appengine.svg)](https://github.com/JamesWoolfenden/terraform-gcp-appengine/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

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
Error: no lines in file
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

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

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
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
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
