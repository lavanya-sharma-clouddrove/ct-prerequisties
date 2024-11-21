output "kms_key_id" {
  description = "The ID of the KMS key"
  value       = module.kms.key_id
}

output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = module.kms.key_arn
}

output "kms_alias_arn" {
  description = "Alias ARN"
  value       = module.kms.alias_arn
}

output "kms_alias_name" {
  description = "Alias Name"
  value       = module.kms.alias_name
}

output "kms_tags" {
  description = "kms tags"
  value       = module.kms.tags
}

output "kms_target_key_id" {
  description = "This is the taget key id"
  value       = module.kms.target_key_id
}

output "s3_bucket_arn" {
  description = "The ARN of the s3 bucket."
  value       = module.control_tower_template_bucket.arn
}

output "s3_bucket_domain" {
  description = "The Domain of the s3 bucket."
  value       = module.control_tower_template_bucket.bucket_domain_name
}

output "s3_bucket_regional_domain" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = module.control_tower_template_bucket.bucket_regional_domain_name
}

output "s3_bucket_id" {
  description = "The ID of the s3 bucket."
  value       = module.control_tower_template_bucket.id
}

output "s3_bucket_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.control_tower_template_bucket.s3_bucket_hosted_zone_id
}

output "s3_bucket_lifecycle_configuration_rules" {
  description = "The lifecycle rules of the bucket, if the bucket is configured with lifecycle rules. If not, this will be an empty string."
  value       = module.control_tower_template_bucket.s3_bucket_lifecycle_configuration_rules
}

output "s3_bucket_policy" {
  description = "The policy of the bucket, if the bucket is configured with a policy. If not, this will be an empty string."
  value       = module.control_tower_template_bucket.s3_bucket_policy
}

output "s3_bucket_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
  value       = module.control_tower_template_bucket.s3_bucket_website_domain
}

output "s3_bucket_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = module.control_tower_template_bucket.s3_bucket_website_endpoint
}

output "s3_bucket_tags" {
  description = "A mapping of tags to assign to the resource."
  value       = module.control_tower_template_bucket.tags
}

output "iam_user_arn" {
  description = "The ARN assigned by AWS for this user."
  value       = module.iam-user.arn
}

output "iam_user_key_id" {
  description = "The access key ID."
  value       = module.iam-user.key_id
}

output "iam_user_tags" {
  description = "A mapping of tags to assign to the resource."
  value       = module.iam-user.tags
}

output "iam_user_unique_id" {
  description = "The unique ID assigned by AWS for this user."
  value       = module.iam-user.unique_id
}