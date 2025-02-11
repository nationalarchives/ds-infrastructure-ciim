terraform {
  backend "s3" {
    bucket = "ds-terraform-state-eu-west-2-676206936717"
    key    = "ds-infrastructure-ciim/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
    region  = "eu-west-2"
    alias   = "intersite"

    assume_role {
      # TODO Arrange for this role trust relationship to be added to ds-terraform/ds-intersite
    role_arn    = "arn:aws:iam::500447081210:role/github-actions-xacct"
  }
}

provider "aws" {
    region  = "eu-west-2"
    alias   = "environment"
}

# this provider is used for command line to  suppress input for region
provider "aws" {
  region  = "eu-west-2"
}
