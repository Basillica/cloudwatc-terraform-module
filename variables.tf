variable "resource_name" {
  description = "The name of the resource to that requires cloudwatch permission"
  type        = string
}

variable "retention_in_days" {
  description = "The duration of the log retention in days"
  type        = number
  default     = 14
}

variable "iam_policy_log_name" {
  description = "The name of the iam policy for the log group"
  type        = string
}

variable "role_name" {
  description = "The name of the role of the resource to which a cloudwatch policy will be attached"
  type        = string
}

variable "path" {
  description = ""
  type        = string
  default     = "/"
}
variable "policy_file" {
  description = "The path to a policy file"
  type        = string
}

variable "create_cloudwatch" {
  description = "Boolean to decide if to create resource or not"
  type = bool
}