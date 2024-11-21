provider "aws" {
  region = var.region
}
module "labels" {
  source  = "clouddrove/labels/aws"
  version = "1.3.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}

resource "aws_cloudformation_stack" "default" {
  count = var.enable_stack ? 1 : 0

  name = var.stack_name

  template_url = var.template_url
  parameters   = var.parameters
  capabilities = var.capabilities

  on_failure         = var.on_failure
  timeout_in_minutes = var.timeout_in_minutes
  tags               = module.labels.tags
}