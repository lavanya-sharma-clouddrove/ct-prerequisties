variable "kms_enabled" {
  description = "Enable or disable the KMS module"
  type        = bool
  default     = true
}

variable "kms_description" {
  description = "Description for the KMS key"
  type        = string
  default     = "KMS key for control tower"
}

variable "kms_enable_key_rotation" {
  description = "Enable key rotation for the KMS key"
  type        = bool
  default     = false
}

variable "kms_multi_region" {
  description = "Enable multi-region KMS key"
  type        = bool
  default     = false
}

variable "bucket_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "bucket_policy" {
  description = "Enable or disable bucket policy"
  type        = bool
  default     = false
}

variable "bucket_only_https_traffic" {
  description = "Enforce HTTPS traffic only for the bucket"
  type        = bool
  default     = false
}

variable "iam_user_name" {
  description = "Name of the IAM module"
  type        = string
  default     = "ct-iam-user"
}

variable "iam_user_user_name" {
  description = "Username for the IAM user"
  type        = string
  default     = "ControlTower"
}

variable "iam_policy_enabled" {
  description = "Enable or disable IAM policy"
  type        = bool
  default     = true
}

variable "iam_user_pgp_key" {
  description = "PGP key for the IAM user"
  type        = string
  default     = ""
}

variable "iam_user_password_length" {
  description = "Password length for the IAM user"
  type        = number
  default     = 20
}

variable "iam_user_password_reset_required" {
  description = "Force password reset for the IAM user"
  type        = bool
  default     = true
}

variable "iam_user_key_enabled" {
  description = "Enable or disable IAM user key"
  type        = bool
  default     = false
}

variable "iam_user_create_login_profile" {
  description = "Create a login profile for the IAM user"
  type        = bool
  default     = false
}

variable "iam_user_policy_actions" {
  description = "Actions for the IAM user policy"
  type        = list(string)
  default     = ["*"]
}

variable "iam_user_policy_resources" {
  description = "Resources for the IAM user policy"
  type        = list(string)
  default     = ["*"]
}
