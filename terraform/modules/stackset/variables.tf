variable "region" {
  type        = string
  description = "Region in which the resources will be deployed."
  default     = "us-east-1"
}

variable "name" {
  type        = string
  description = "Name to assign to the resources created."
  default     = "test"
}

variable "environment" {
  type        = string
  description = "Environment in which the resources are being deployed, e.g., 'dev', 'prod'."
  default     = "test"
}

variable "managedby" {
  type        = string
  description = "The contact information or identifier for the entity managing the resources."
  default     = "hello@clouddrove.com"
}

variable "auto_deployment" {
  description = "Configuration for automatic deployment, specifying whether to enable it and retain stacks on account removal."
  type = object({
    enabled                          = bool
    retain_stacks_on_account_removal = bool
  })
  default = {
    enabled                          = false
    retain_stacks_on_account_removal = false
  }
}

variable "label_order" {
  type        = list(any)
  description = "Order of labels applied to resources, such as 'name', 'application'."
  default     = []
}


variable "stack_set_name" {
  type        = string
  description = "Name assigned to the CloudFormation StackSet."
  default     = "stack"
}

variable "enable_stackset" {
  type        = bool
  description = "Boolean to indicate whether to enable StackSet deployment."
  default     = true
}

variable "description" {
  type        = string
  description = "Description of the CloudFormation StackSet."
  default     = "Description about the stackset"
}

variable "permission_model" {
  type        = string
  description = "Defines the IAM role creation model for StackSet operations. Valid values: SELF_MANAGED (default), SERVICE_MANAGED."
  default     = "SELF_MANAGED"
}

variable "call_as" {
  type        = string
  description = "Indicates if you are acting as an account administrator or delegated administrator. Valid values: SELF (default), DELEGATED_ADMIN."
  default     = "SELF"
}

variable "execution_role_name" {
  type        = string
  description = "IAM Role name in target accounts for StackSet operations (only used in SELF_MANAGED permission model)."
  default     = null
}

variable "administration_role_arn" {
  type        = string
  description = "ARN of the IAM Role in the administrator account. Must be set for the SELF_MANAGED permission model."
  default     = null
}

variable "capabilities" {
  type        = list(string)
  description = "List of capabilities required by the StackSet. Valid values: CAPABILITY_IAM, CAPABILITY_NAMED_IAM, CAPABILITY_AUTO_EXPAND."
  default     = ["CAPABILITY_NAMED_IAM"]
}

variable "parameters" {
  type        = map(string)
  description = "Map of input parameters for the StackSet template. Ensure all parameters, including NoEcho, are accounted for."
  default     = {}
}

variable "operation_preferences" {
  type        = any
  description = "Configures failure tolerance, concurrency, and region order options for StackSet operations."
  default = {
    failure_tolerance_count      = null
    failure_tolerance_percentage = null
    max_concurrent_count         = null
    max_concurrent_percentage    = null
    region_concurrency_type      = null
    region_order                 = null
  }
}

variable "template_url" {
  type        = string
  description = "URL pointing to the CloudFormation template body in an S3 bucket. Conflicts with template_body."
  default     = null
}

variable "stackset_instance_organizational_unit_ids" {
  type        = list(string)
  description = "Organization root ID or OU IDs for StackSet instance deployment."
  default     = null
}

variable "create_instance" {
  type        = bool
  description = "Indicates whether to create a StackSet instance. Defaults to true."
  default     = true
}

variable "stackset_instance_retain_stack" {
  type        = bool
  description = "Option to retain the Stack during StackSet instance destruction, preserving resources. Defaults to false."
  default     = false
}

variable "stackset_instance_call_as" {
  type        = string
  description = "Specifies if you are acting as an administrator or delegated administrator. Valid values: SELF (default), DELEGATED_ADMIN."
  default     = "SELF"
}

variable "stackset_instance_region" {
  type        = string
  description = "Target AWS region for the StackSet instance creation. Defaults to the current region."
  default     = null
}

variable "stackset_instance_account_id" {
  type        = list(string)
  description = "List of AWS Account IDs for the StackSet instance creation."
  default     = []
}

variable "stackset_instance_accounts" {
  type        = list(string)
  description = "List of AWS Account IDs to deploy StackSet instances to."
  default     = null
}