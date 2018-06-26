provider "external" {}

data "external" "heptio_authenticator_aws" {
  program = ["bash", "${path.module}/authenticator.sh"]

  query {
    cluster_name = "terraform-eks"
  }
}

provider "kubernetes" {
  token = "${data.external.heptio_authenticator_aws.result.token}"
}


