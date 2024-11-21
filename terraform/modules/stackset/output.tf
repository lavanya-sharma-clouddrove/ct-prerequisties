output "stack_set_name" {
  description = "The name of the CloudFormation stack set"
  value       = try(aws_cloudformation_stack_set.default[0].name, null)
}

output "stack_set_description" {
  description = "The description of the CloudFormation stack set"
  value       = try(aws_cloudformation_stack_set.default[0].description, null)
}

output "stack_set_tags" {
  description = "The tags associated with the CloudFormation stack set"
  value       = try(aws_cloudformation_stack_set.default[0].tags, null)
}

output "auto_deployment_enabled" {
  description = "Whether auto deployment is enabled"
  value       = var.auto_deployment.enabled
}

output "stack_set_instance_count" {
  description = "The number of stack set instances"
  value       = try(length(aws_cloudformation_stack_set_instance.default), 0)
}

output "stack_set_instance_account_ids" {
  description = "The account IDs for the stack set instances"
  value       = try([for instance in aws_cloudformation_stack_set_instance.default : instance.account_id], [])
}

output "stack_set_instance_region" {
  description = "The region for the stack set instance"
  value       = try([for instance in aws_cloudformation_stack_set_instance.default : instance.region], [])
}