module "deployment-central" {
  source = "./deployment"
  providers = {
    aws = aws.central
  }
  region = "eu-central-1"
  profile = "cta"
}

module "deployment-west" {
  source = "./deployment"
  providers = {
    aws = aws.west
  }
  region = "eu-west-1"
  profile = "cta"
}
