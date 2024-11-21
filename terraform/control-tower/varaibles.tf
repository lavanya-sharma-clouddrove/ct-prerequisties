# -------------------- Common Variables ------------------------
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy resources"
}

variable "execution_role_name" {
  type        = string
  default     = "AWSControlTowerExecution"
  description = "Role name for AWS Control Tower execution"
}

variable "administration_role_arn" {
  type        = string
  default     = ""
  description = "ARN for the administration role"
}

variable "capabilities" {
  type        = list(string)
  default     = ["CAPABILITY_NAMED_IAM"]
  description = "CloudFormation stack capabilities"
}

variable "delegated_account_id" {
  type        = string
  default     = ""
  description = "Delegated account ID"
}

variable "source_bucket" {
  type        = string
  default     = "control-tower-lavanya"
  description = "S3 bucket for source templates and Lambda files"
}

variable "role_to_assume" {
  type        = string
  default     = "AWSControlTowerExecution"
  description = "Role to assume for cross-account access"
}

variable "excluded_accounts" {
  type        = list(string)
  default     = ["", ""]
  description = "Account IDs to exclude from deployment"
}

# ---------------- Access Analyzer Variables -------------------
variable "access_analyser_stackset_name" {
  type        = string
  default     = "Access-Analyser"
  description = "CloudFormation StackSet name for Access Analyzer"
}

variable "access_analyser_description" {
  type        = string
  default     = "StackSet for AWS Access Analyzer"
  description = "Description for Access Analyzer StackSet"
}

variable "enable_access_analyzer" {
  type        = bool
  default     = false
  description = "Enable Access Analyzer deployment"
}

variable "access_analyzer_template_file_s3_Object_url" {
  type        = string
  default     = ""
  description = "URL to Access Analyzer CloudFormation template"
}

variable "access_analyser_lambda_file_s3_key" {
  type        = string
  default     = "access-analyser/access-analyser.zip"
  description = "S3 key for Access Analyzer Lambda code"
}

# ---------------- Detective Variables -------------------------
variable "enable_detective" {
  type        = bool
  default     = true
  description = "Enable Amazon Detective deployment"
}

variable "detective_description" {
  type        = string
  default     = "Detective StackSet"
  description = "Description for Detective StackSet"
}

variable "detective_stackset_name" {
  type        = string
  default     = "Detective"
  description = "CloudFormation StackSet name for Detective"
}

variable "detective_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "URL to Detective CloudFormation template"
}

variable "detective_lambda_file_s3_key" {
  type        = string
  default     = "detective/detective.zip"
  description = "S3 key for Detective Lambda code"
}

# ---------------- GuardDuty Variables -------------------------
variable "enable_guardduty" {
  type        = bool
  default     = false
  description = "Enable GuardDuty deployment"
}

variable "guardduty_stack_name" {
  type        = string
  default     = "Guardduty"
  description = "CloudFormation stack name for GuardDuty"
}

variable "guardduty_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "URL to GuardDuty CloudFormation template"
}

variable "guardduty_lambda_file_s3_key" {
  type        = string
  default     = "guardduty/guardduty_enabler.zip"
  description = "S3 key for GuardDuty Lambda code"
}

# ---------------- Inspector Variables -------------------------
variable "enable_inspector" {
  type        = bool
  default     = false
  description = "Enable Inspector deployment"
}

variable "inspector_stackset_name" {
  type        = string
  default     = "Inspector"
  description = "CloudFormation StackSet name for Inspector"
}

variable "inspector_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "URL to Inspector CloudFormation template"
}

variable "inspector_lambda_file_s3_key" {
  type        = string
  default     = "inspector/inspector.zip"
  description = "S3 key for Inspector Lambda code"
}

variable "inspector_description" {
  type        = string
  default     = "Inspector StackSet"
  description = "Description for Inspector StackSet"
}

# ---------------- Security Hub Variables ----------------------
variable "enable_security_hub" {
  type        = bool
  default     = false
  description = "Enable Security Hub deployment"
}

variable "security_hub_stack_name" {
  type        = string
  default     = "Securityhub"
  description = "CloudFormation stack name for Security Hub"
}

variable "security_hub_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "URL to Security Hub CloudFormation template"
}

variable "security_hub_lambda_file_s3_key" {
  type        = string
  default     = "security-hub/securityhub_enabler.zip"
  description = "S3 key for Security Hub Lambda code"
}

variable "security_hub_aws_standard" {
  type        = string
  default     = "Yes"
  description = "Enable AWS standard (Yes/No)"
}

variable "security_hub_cis120_standard" {
  type        = string
  default     = "No"
  description = "Enable CIS 1.20 standard (Yes/No)"
}

variable "security_hub_cis140_standard" {
  type        = string
  default     = "Yes"
  description = "Enable CIS 1.40 standard (Yes/No)"
}

variable "security_hub_pci_standard" {
  type        = string
  default     = "Yes"
  description = "Enable PCI standard (Yes/No)"
}

variable "security_hub_nist_standard" {
  type        = string
  default     = "Yes"
  description = "Enable NIST standard (Yes/No)"
}

# ---------------- AWS Config Variables -----------------------
variable "enable_config" {
  type        = bool
  default     = false
  description = "Enable AWS Config deployment"
}

variable "config_stack_name" {
  type        = string
  default     = "Aws-config"
  description = "CloudFormation stack name for AWS Config"
}

variable "config_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "URL to AWS Config CloudFormation template"
}


#-----------------Inspection Lambda Variables------------
variable "enable_inspection_lambda" {
  type        = bool
  default     = false
  description = "Set to true to deploy stack for inspection lambda, otherwise false."
}

variable "inspection_lambda_stack_name" {
  type        = string
  default     = "Inspection-lambda"
  description = "Name of the inspection lambda stack."
}

variable "inspection_lambda_template_s3_object_url" {
  type        = string
  default     = ""
  description = "Lambda template URL from S3 bucket."
}

variable "inspection_lambda_lambda_file_s3_key" {
  type        = string
  default     = "inspection-lambda/aws-inspection-lambda.zip"
  description = "Lambda code zip file path for inspection lambda."
}

variable "inspection_destination_bucket_name" {
  type        = string
  default     = "logging-inspection-lambda"
  description = "Destination bucket name for inspection lambda."
}

#----------------------Macie Variables---------------------
variable "enable_macie" {
  type        = bool
  default     = false
  description = "Set to true to deploy stack for Macie, otherwise false."
}

variable "macie_stack_name" {
  type        = string
  default     = "Aws-macie"
  description = "Name of the CloudFormation stack for Macie."
}

variable "macie_template_file_object_url" {
  type        = string
  default     = ""
  description = "Template file URL for Macie."
}

variable "macie_lambda_file_s3_key" {
  type        = string
  default     = "aws-macie/macie.zip"
  description = "Lambda code zip file path for Macie."
}

#---------------Subdomain Delegation Variables---------------
#----------Master---------------
variable "enable_subdomain_delegation_master" {
  type        = bool
  default     = false
  description = "Set to true to deploy subdomain delegation master, otherwise false."
}

variable "subdomain_delegation_master_stack_name" {
  type        = string
  default     = "Subdomain-delegation-master"
  description = "Name of the master stack for subdomain delegation."
}

variable "subdomain_delegation_master_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "Template URL from S3 for master stack."
}

variable "subdomain_delegation_hosted_zone_id" {
  type        = string
  default     = ""
  description = "Hosted zone ID for master stack."
}

variable "subdomain_delegation_authorized_account" {
  type        = string
  default     = ""
  description = "Authorized account ID for subdomain delegation master stack."
}

variable "subdomain_delegation_lambda_file_s3_key" {
  type        = string
  default     = "subdomain-delegation/subdomain-delegation-2.zip"
  description = "Lambda code zip file path for master stack."
}

#-----------------Child----------------------
variable "enable_subdomain_delegation_child" {
  type        = bool
  default     = false
  description = "Set to true to deploy subdomain delegation child, otherwise false."
}

variable "subdomain_delegation_child_stack_name" {
  type        = string
  default     = "Subdomain-delegation-child"
  description = "Child stack name for subdomain delegation."
}

variable "subdomain_delegation_domain_name" {
  type        = string
  default     = "testing.com"
  description = "Domain name for subdomain delegation child stack."
}

variable "subdomain_delegation_child_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "Template URL from S3 for child stack."
}

#-----------------AWS Webhook Notifications----------------------
variable "enable_notification_webhook" {
  type        = bool
  default     = false
  description = "Set to true to deploy stack for AWS notification webhook, otherwise false."
}

variable "notification_webhook_stack_name" {
  type        = string
  default     = "Notification-webhook"
  description = "AWS notification webhook stack name."
}

variable "notification_webhook_template_file_s3_object_url" {
  type        = string
  default     = ""
  description = "AWS notification webhook CloudFormation template URL."
}

variable "webhook_url" {
  type        = string
  default     = ""
  description = "Webhook URL for Slack or any other service."
}

variable "notification_webhook_rule_filter" {
  type        = string
  default     = "ALL_RULES"
  description = "Filter rules for AWS notification webhook."
}

variable "notification_webhook_lambda_file_s3_key" {
  type        = string
  default     = "notification-webhook/aws-control-tower-webhook-notifications.zip"
  description = "Path for Lambda code zip file in S3 bucket."
}

# ----------------------- AWS Backup Variables ----------------------

# General Settings for Tags
variable "aws_backup_stackset_instance_account_id" {
  type        = list(string)
  default     = [""]
  description = "list of account ids to deploy stackset instance for aws backup."
}
variable "pTagKey1" {
  description = "Primary tag key for resource identification"
  type        = string
  default     = "deployedby"
}

variable "pTagValue1" {
  description = "Primary tag value for resource identification"
  type        = string
  default     = "stackset"
}

variable "pBackupTagKey2" {
  description = "Secondary tag key specific to backup resources"
  type        = string
  default     = "backup"
}

variable "pBackupTagValue2" {
  description = "Secondary tag value specific to backup resources"
  type        = string
  default     = "enable"
}

variable "pTagKey2" {
  description = "Additional tag key for resource identification"
  type        = string
  default     = "deployedby"
}

variable "pTagValue2" {
  description = "Additional tag value for resource identification"
  type        = string
  default     = "stackset"
}

# Backup Member Account Role Settings
variable "enable_backup_member_account_role" {
  description = "Enable creation of StackSet for AWS Backup member account role"
  type        = bool
  default     = false
}

variable "backup_member_account_role_stackset_name" {
  description = "Name for the StackSet of the backup member account role"
  type        = string
  default     = "backup-member-account-role"
}

variable "backup_member_account_role_description" {
  description = "Description for the backup member account role"
  type        = string
  default     = "AWS Backup member account role"
}

variable "backup_member_role_template_file_s3_object_url" {
  description = "S3 URL for the backup member account IAM role template"
  type        = string
  default     = ""
}

# Backup Member Account Settings
variable "enable_backup_member_account" {
  description = "Enable creation of StackSet for AWS Backup member account"
  type        = bool
  default     = false
}

variable "backup_member_account_stackset_name" {
  description = "Name for the StackSet of the backup member account"
  type        = string
  default     = "backup-member-account"
}

variable "backup_member_account_template_s3_object_url" {
  description = "S3 URL for the backup member account template"
  type        = string
  default     = ""
}

variable "backup_member_account_description" {
  description = "Description for the backup member account"
  type        = string
  default     = "AWS Backup member account description"
}

variable "pCrossAccountBackupRole" {
  description = "Role for cross-account backup access"
  type        = string
  default     = "awsbackuprole"
}

variable "pMemberBackupVaultName" {
  description = "Name of the backup vault in the member account"
  type        = string
  default     = "awsbackupvault"
}

# Central Backup Account Settings
variable "enable_central_backup_account" {
  description = "Enable creation of StackSet for AWS Backup central account"
  type        = bool
  default     = false
}

variable "central_backup_account_stackset_name" {
  description = "Name for the StackSet of the central backup account"
  type        = string
  default     = "central-backup-account"
}

variable "central_backup_account_description" {
  description = "Description for the central backup account"
  type        = string
  default     = "Central AWS Backup account"
}

variable "central_backup_account_template_s3_object_url" {
  description = "S3 URL for the central backup account template"
  type        = string
  default     = ""
}

# Central Backup Organization Account Settings
variable "enable_central_backup_org_account" {
  description = "Enable creation of StackSet for AWS Backup organization account"
  type        = bool
  default     = false
}

variable "central_backup_org_account_stack_name" {
  description = "Name for the StackSet of the central backup organization account"
  type        = string
  default     = "central-backup-org-account"
}

variable "central_backup_org_account_template_s3_object_url" {
  description = "S3 URL for the central backup organization account template"
  type        = string
  default     = ""
}

# Backup Vault and Key Settings
variable "pBackupKeyAlias" {
  description = "Alias for the backup encryption key"
  type        = string
  default     = "awsbackupkey"
}

variable "pCentralBackupVaultArn" {
  description = "ARN for the central backup vault"
  type        = string
  default     = ""
}