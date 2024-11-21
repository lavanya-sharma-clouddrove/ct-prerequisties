terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

locals {
  name        = "example-project"
  environment = "dev"
  label_order = ["name", "environment"]
}


module "kms" {
  source  = "clouddrove/kms/aws"
  version = "1.3.1"

  name                = "${local.name}-controlTower-kms"
  environment         = local.environment
  label_order         = local.label_order
  enabled             = var.kms_enabled
  description         = var.kms_description
  enable_key_rotation = var.kms_enable_key_rotation
  policy              = data.aws_iam_policy_document.kms.json
  multi_region        = var.kms_multi_region
}

module "control_tower_template_bucket" {
  source  = "clouddrove/s3/aws"
  version = "2.0"

  name               = "${local.name}-control-tower-cloudformation-template"
  versioning         = var.bucket_versioning
  bucket_policy      = var.bucket_policy
  only_https_traffic = var.bucket_only_https_traffic
}

module "iam-user" {
  source  = "clouddrove/iam-user/aws"
  version = "1.3.0"

  name                          = var.iam_user_name
  user_name                     = var.iam_user_user_name
  environment                   = local.environment
  label_order                   = local.label_order
  policy_enabled                = var.iam_policy_enabled
  policy                        = data.aws_iam_policy_document.ct-user.json
  password_length               = var.iam_user_password_length
  key_enabled                   = var.iam_user_key_enabled
  password_reset_required       = var.iam_user_password_reset_required
  create_iam_user_login_profile = var.iam_user_create_login_profile
  pgp_key                       = var.iam_user_pgp_key
}

data "aws_iam_policy_document" "ct-user" {
  statement {
    actions   = var.iam_user_policy_actions
    effect    = "Allow"
    resources = var.iam_user_policy_resources
  }
}