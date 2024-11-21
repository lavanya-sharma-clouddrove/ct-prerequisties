variable "region" {
  type        = string
  description = "Region in which we want to deploy."
  default     = "us-east-1"
}

variable "name" {
  type        = string
  default     = "test"
  description = "The name for the stack resources."
}

variable "environment" {
  type        = string
  default     = "test"
  description = "The environment in which the stack is deployed, e.g., 'dev', 'staging', or 'prod'."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "Email address or identifier for the entity managing this stack."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Order of labels to apply to resources, e.g., `name`,`application`."
}

variable "enable_stack" {
  type        = bool
  default     = true
  description = "Boolean to control whether the stack is deployed; set to true to deploy."
}

variable "stack_name" {
  type        = string
  default     = "stack"
  description = "The name to assign to the stack."
}

variable "template_url" {
  type        = string
  description = "URL to the S3 location of the CloudFormation template file. Max size: 460,800 bytes."
}

variable "parameters" {
  type        = map(string)
  default     = {}
  description = "Key-value map of input parameters for the Stack Set template (e.g., map(\"BusinessUnit\",\"ABC\"))."
}

variable "capabilities" {
  type        = list(string)
  default     = ["CAPABILITY_NAMED_IAM"]
  description = "List of capabilities for the stack, valid values: CAPABILITY_IAM, CAPABILITY_NAMED_IAM, CAPABILITY_AUTO_EXPAND."
}

variable "on_failure" {
  type        = string
  default     = "ROLLBACK"
  description = "Action on stack creation failure: `DO_NOTHING`, `ROLLBACK`, or `DELETE`."
}

variable "timeout_in_minutes" {
  type        = number
  default     = 30
  description = "Max time (in minutes) for stack creation before marking as CREATE_FAILED."
}

variable "policy_body" {
  type        = string
  default     = ""
  description = "JSON or YAML structure defining the stack policy."
}