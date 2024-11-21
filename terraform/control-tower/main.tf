
provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}
data "aws_organizations_organization" "organization" {}


# Access Analyzer

module "access_analyser_stackset" {
  source                  = "./../modules/stackset"
  stack_set_name          = var.access_analyser_stackset_name
  description             = var.access_analyser_description
  enable_stackset         = var.enable_access_analyzer
  execution_role_name     = var.execution_role_name
  administration_role_arn = var.administration_role_arn
  capabilities            = var.capabilities
  parameters = {
    OrganizationId                = data.aws_organizations_organization.organization.id
    AccessAnalyserMasterAccountId = var.delegated_account_id
    S3SourceBucket                = var.source_bucket
    S3Key                         = var.access_analyser_lambda_file_s3_key
    RoleToAssume                  = var.role_to_assume
    ExcludedAccounts              = join(",", var.excluded_accounts)
  }
  region                                    = var.region
  create_instance                           = var.enable_access_analyzer
  stackset_instance_account_id              = [data.aws_caller_identity.current.account_id]
  template_url                              = var.access_analyzer_template_file_s3_Object_url
  stackset_instance_organizational_unit_ids = [data.aws_organizations_organization.organization.id]
}


# Detective 
module "detective_stackset" {
  source                  = "./../modules/stackset"
  stack_set_name          = var.detective_stackset_name
  description             = var.detective_description
  enable_stackset         = var.enable_detective
  execution_role_name     = var.execution_role_name
  administration_role_arn = var.administration_role_arn
  capabilities            = var.capabilities
  parameters = {
    OrganizationId           = data.aws_organizations_organization.organization.id
    DetectiveMasterAccountId = var.delegated_account_id
    S3SourceBucket           = var.source_bucket
    S3Key                    = var.detective_lambda_file_s3_key
    RoleToAssume             = var.role_to_assume
    ExcludedAccounts         = join(",", var.excluded_accounts)
  }
  region                                    = var.region
  stackset_instance_account_id              = [data.aws_caller_identity.current.account_id]
  template_url                              = var.detective_template_file_s3_object_url
  stackset_instance_organizational_unit_ids = [data.aws_organizations_organization.organization.id]
}


# # GuardDuty 

module "guardduty_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_guardduty

  stack_name = var.guardduty_stack_name

  template_url = var.guardduty_template_file_s3_object_url
  parameters = {
    OrganizationId    = data.aws_organizations_organization.organization.id
    SecurityAccountId = var.delegated_account_id
    S3SourceBucket    = var.source_bucket
    S3SourceFile      = var.guardduty_template_file_s3_object_url
  }
  capabilities = var.capabilities
}

# # Inspector
module "inspector_stackset" {
  source                  = "./../modules/stackset"
  stack_set_name          = var.inspector_stackset_name
  description             = var.inspector_description
  enable_stackset         = var.enable_inspector
  execution_role_name     = var.execution_role_name
  administration_role_arn = var.administration_role_arn
  capabilities            = var.capabilities
  parameters = {
    OrganizationId          = data.aws_organizations_organization.organization.id
    InspectorAuditAccountId = var.delegated_account_id
    S3SourceBucket          = var.source_bucket
    S3Key                   = var.inspector_lambda_file_s3_key
    RoleToAssume            = var.role_to_assume
    ExcludedAccounts        = join(",", var.excluded_accounts)
  }
  region                                    = var.region
  stackset_instance_account_id              = [data.aws_caller_identity.current.account_id]
  template_url                              = var.inspector_template_file_s3_object_url
  stackset_instance_organizational_unit_ids = [data.aws_organizations_organization.organization.id]
}

# # Security Hub

module "security_hub_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_security_hub

  stack_name = var.security_hub_stack_name

  template_url = var.security_hub_template_file_s3_object_url
  parameters = {
    SecurityAccountId = var.delegated_account_id
    ExcludedAccounts  = join(",", var.excluded_accounts)
    OrganizationId    = data.aws_organizations_organization.organization.id
    S3SourceBucket    = var.source_bucket
    S3SourceKey       = var.security_hub_lambda_file_s3_key
    RoleToAssume      = var.role_to_assume
    AWSStandard       = var.security_hub_aws_standard
    CIS120Standard    = var.security_hub_cis120_standard
    CIS140Standard    = var.security_hub_cis140_standard
    PCIStandard       = var.security_hub_pci_standard
    NISTStandard      = var.security_hub_nist_standard
  }
  capabilities = var.capabilities
}

# # Config

module "config_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_config

  stack_name = var.config_stack_name

  template_url = var.config_template_file_s3_object_url
  parameters = {
    ExcludedAccounts = join(",", var.excluded_accounts)
    S3SourceBucket   = var.source_bucket
  }
  capabilities = var.capabilities
}


# # Inspection Lambda

module "inspection_lambda_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_inspection_lambda

  stack_name = var.inspection_lambda_stack_name

  template_url = var.inspection_lambda_template_s3_object_url
  parameters = {
    DestinationBucketName = var.inspection_destination_bucket_name
    OrganizationId        = data.aws_organizations_organization.organization.id
    AssumeRole            = var.role_to_assume
    S3SourceBucket        = var.source_bucket
    S3Key                 = var.inspection_lambda_lambda_file_s3_key
  }
  capabilities = var.capabilities
}

# # Macie

module "macie_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_macie

  stack_name = var.macie_stack_name

  template_url = var.macie_template_file_object_url
  parameters = {
    OrganizationId       = data.aws_organizations_organization.organization.id
    S3SourceBucket       = var.source_bucket
    S3Key                = var.macie_lambda_file_s3_key
    MacieMasterAccountId = var.delegated_account_id
  }
  capabilities = var.capabilities
}


# # Subdomain Delegation (Master Stack)

module "subdomain_delegation_master_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_subdomain_delegation_master

  stack_name = var.subdomain_delegation_master_stack_name

  template_url = var.subdomain_delegation_master_template_file_s3_object_url
  parameters = {
    HostedZoneId       = var.subdomain_delegation_hosted_zone_id
    AuthorizedAccounts = var.subdomain_delegation_authorized_account
    S3Bucket           = var.source_bucket
    S3Key              = var.subdomain_delegation_lambda_file_s3_key
  }
  capabilities = var.capabilities
}


# # Subdomain Delegation (Child Stack)

module "subdomain_delegation_child_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_subdomain_delegation_child

  stack_name = var.subdomain_delegation_child_stack_name

  template_url = var.subdomain_delegation_child_template_file_s3_object_url
  parameters = {
    DomainName      = var.subdomain_delegation_domain_name
    MasterAccountId = var.delegated_account_id
  }
  capabilities = var.capabilities
}



# #aws webhook

module "webhook_notification_stack" {
  source       = "./../modules/stack"
  enable_stack = var.enable_notification_webhook

  stack_name = var.notification_webhook_stack_name

  template_url = var.notification_webhook_template_file_s3_object_url
  parameters = {
    WebhookUrl   = var.webhook_url
    RuleFilter   = var.notification_webhook_rule_filter
    S3BucketName = var.source_bucket
    S3Key        = var.notification_webhook_lambda_file_s3_key
  }
  capabilities = var.capabilities
}


# # AWS CloudFormation StackSet and StackSet Instances for AWS Backups

module "backup_member_account_role" {
  source                  = "./../modules/stackset"
  stack_set_name          = var.backup_member_account_role_stackset_name
  description             = var.backup_member_account_role_description
  enable_stackset         = var.enable_backup_member_account_role
  execution_role_name     = var.execution_role_name
  administration_role_arn = var.administration_role_arn
  capabilities            = var.capabilities
  parameters = {
    pCrossAccountBackupRole = var.pCrossAccountBackupRole
    pTagKey1                = var.pTagKey1
    pTagValue1              = var.pTagValue1
  }
  region                                    = var.region
  stackset_instance_account_id              = var.aws_backup_stackset_instance_account_id
  template_url                              = var.backup_member_role_template_file_s3_object_url
  stackset_instance_organizational_unit_ids = [data.aws_organizations_organization.organization.id]
}

# # Backup Member Account StackSet

module "backup_member_account" {
  source                  = "./../modules/stackset"
  stack_set_name          = var.backup_member_account_stackset_name
  description             = var.backup_member_account_description
  enable_stackset         = var.enable_backup_member_account
  execution_role_name     = var.execution_role_name
  administration_role_arn = var.administration_role_arn
  capabilities            = var.capabilities
  parameters = {
    pTagKey1                = var.pTagKey1
    pTagValue1              = var.pTagValue1
    pCrossAccountBackupRole = var.pCrossAccountBackupRole
    pBackupKeyAlias         = var.pBackupKeyAlias
    pMemberBackupVaultName  = var.pMemberBackupVaultName
    pOrganizationId         = data.aws_organizations_organization.organization.id
  }
  region                                    = var.region
  stackset_instance_account_id              = var.aws_backup_stackset_instance_account_id
  template_url                              = var.backup_member_account_template_s3_object_url
  stackset_instance_organizational_unit_ids = [data.aws_organizations_organization.organization.id]
}

# # Central Backup Account StackSet

module "central_backup_account" {
  source                  = "./../modules/stackset"
  stack_set_name          = var.central_backup_account_stackset_name
  description             = var.central_backup_account_description
  enable_stackset         = var.enable_central_backup_account
  execution_role_name     = var.execution_role_name
  administration_role_arn = var.administration_role_arn
  capabilities            = var.capabilities
  parameters = {
    pTagKey1                = var.pTagKey1
    pTagValue1              = var.pTagValue1
    pBackupKeyAlias         = var.pBackupKeyAlias
    pCrossAccountBackupRole = var.pCrossAccountBackupRole
    pCentralBackupVaultName = var.pMemberBackupVaultName
    pOrganizationId         = data.aws_organizations_organization.organization.id
  }
  region                                    = var.region
  stackset_instance_account_id              = var.aws_backup_stackset_instance_account_id
  template_url                              = var.central_backup_account_template_s3_object_url
  stackset_instance_organizational_unit_ids = [data.aws_organizations_organization.organization.id]
}

# # Central Backup Organization Account StackSet


module "central_backup_org_account" {
  source       = "./../modules/stack"
  enable_stack = var.enable_central_backup_org_account
  stack_name   = var.central_backup_org_account_stack_name

  template_url = var.central_backup_org_account_template_s3_object_url
  parameters = {
    pCrossAccountBackupRole   = var.pCrossAccountBackupRole
    pTagKey                   = var.pTagKey1
    pTagValue                 = var.pTagValue1
    pOrgbackupAccounts        = data.aws_caller_identity.current.account_id
    pMemberAccountBackupVault = var.pMemberBackupVaultName
    pCentralBackupVaultArn    = var.pCentralBackupVaultArn
    pBackupTagKey1            = var.pTagKey1
    pBackupTagKey2            = var.pTagKey2
    pBackupTagValue1          = var.pTagValue1
    pBackupTagValue2          = var.pTagValue2
  }
  capabilities = var.capabilities
}