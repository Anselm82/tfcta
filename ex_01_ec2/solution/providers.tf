terraform {
  required_version = "~> 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.13" # v3.38.0 minimal version to use default tags
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = var.profile
  default_tags {
    tags = {
      project                      = "default-${var.project}"
      created_by                   = "terraform"
      disposable                   = true
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  alias = "central"
  profile = var.profile
  default_tags {
    tags = {
      project                      = "central-${var.project}"
      created_by                   = "terraform"
      disposable                   = true
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  alias = "west"
  profile = var.profile
  default_tags {
    tags = {
      project                      = "west-${var.project}"
      created_by                   = "terraform"
      disposable                   = true
    }
  }
}