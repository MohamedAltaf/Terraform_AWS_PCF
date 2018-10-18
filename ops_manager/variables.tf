variable "count" {}

variable "optional_count" {}

variable "private" {}

variable "env_name" {}

variable "ami" {}

variable "optional_ami" {}

variable "instance_type" {}

variable "subnet_id" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

variable "key_name" {
  default = "terraform"
}

variable "ops_manager_ip" {
  type        = "string"
  description = "IP Address for Ops Manager. It must be a valid IP from the Management Subnet Zone1. CIDR block fir subnet is 10.119.27.128/28"
  default     = "10.119.27.140"
}

variable "iam_ops_manager_user_name" {}

variable "iam_ops_manager_role_name" {}

variable "iam_ops_manager_role_arn" {}

variable "iam_pas_bucket_role_arn" {}

variable "instance_profile_name" {}

variable "instance_profile_arn" {}

variable "dns_suffix" {}

variable "zone_id" {}

variable "bucket_suffix" {}

variable "tags" {
  type = "map"
}

variable "default_tags" {
  type = "map"
}
