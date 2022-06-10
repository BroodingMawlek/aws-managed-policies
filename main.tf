terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "3.74.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "oidc_role" {
  source          = "./modules/iam/oidc"
  oidc_url        = var.oidc_url
  audiance_list   = [var.audiance_list]
  thumbprint_list = [var.thumbprint_list]
  policy_role     = var.policy_role
  policy_arn      = var.policy_arn

}