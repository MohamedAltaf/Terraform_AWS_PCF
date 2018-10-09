variable "env_name" {}

variable "hosted_zone" {
  default = ""
}

variable "access_key" {}

variable "secret_key" {}

variable "region" {}

variable "availability_zones" {
  type = "list"
}

variable "vpc_cidr" {
  type    = "string"
  default = "10.119.26.0/23"
}

variable "management_cidr_1" {
  type        = "string"
  description = "cidr for management subnet on zone 1"
  default     = "10.119.27.128/28"
}

variable "management_cidr_2" {
  type        = "string"
  description = "cidr for management subnet on zone 2"
  default     = "10.119.27.144/28"
}

variable "management_cidr_3" {
  type        = "string"
  description = "cidr for management subnet on zone 3"
  default     = "10.119.27.160/28"
}

variable "pas_cidr_1" {
  type        = "string"
  description = "cidr for pas subnet on zone 1"
  default     = "10.119.26.0/25"
}

variable "pas_cidr_2" {
  type        = "string"
  description = "cidr for pas subnet on zone 2"
  default     = "10.119.26.128/25"
}

variable "pas_cidr_3" {
  type        = "string"
  description = "cidr for pas subnet on zone 3"
  default     = "10.119.27.0/25"
}

variable "services_cidr_1" {
  type        = "string"
  description = "cidr for services subnet on zone 1"
  default     = "10.119.27.176/28"
}

variable "services_cidr_2" {
  type        = "string"
  description = "cidr for services subnet on zone 2"
  default     = "10.119.27.192/28"
}

variable "services_cidr_3" {
  type        = "string"
  description = "cidr for services subnet on zone 3"
  default     = "10.119.27.208/28"
}

variable "create_versioned_pas_buckets" {
  default = false
}

variable "create_backup_pas_buckets" {
  default = false
}

variable "ops_manager_ami" {
  default = ""
}

variable "optional_ops_manager_ami" {
  default = ""
}

variable "ops_manager_instance_type" {
  default = "r4.large"
}

variable "ops_manager_private" {
  default = false
  description = "If true, the Ops Manager will be colocated with the BOSH director on the management subnet instead of on the public subnet"
}

variable "rds_db_username" {
  default = "admin"
}

variable "rds_instance_class" {
  default = "db.m4.large"
}

variable "rds_instance_count" {
  type    = "string"
  default = 0
}

variable "ops_manager" {
  default = true
}

variable "optional_ops_manager" {
  default = false
}

variable "ssl_cert" {
  type        = "string"
  description = "the contents of an SSL certificate to be used by the LB, optional if `ssl_cert_arn` or `ssl_ca_cert` is provided"
  default     = ""
}

variable "ssl_private_key" {
  type        = "string"
  description = "the contents of an SSL private key to be used by the LB, optional if `ssl_cert_arn` or `ssl_ca_cert` is provided"
  default     = ""
}

/*****************************
 * Isolation Segment Options *
 *****************************/

variable "isoseg_ssl_cert" {
  type        = "string"
  description = "the contents of an SSL certificate to be used by the LB, optional if `isoseg_ssl_ca_cert` is provided"
  default     = ""
}

variable "isoseg_ssl_private_key" {
  type        = "string"
  description = "the contents of an SSL private key to be used by the LB, optional if `isoseg_ssl_ca_cert` is provided"
  default     = ""
}

variable "isoseg_ssl_ca_cert" {
  type        = "string"
  description = "the contents of a CA public key to be used to sign the generated iso seg LB certificate, optional if `isoseg_ssl_cert` is provided"
  default     = ""
}

variable "isoseg_ssl_ca_private_key" {
  type        = "string"
  description = "the contents of a CA private key to be used to sign the generated iso seg LB certificate, optional if `isoseg_ssl_cert` is provided"
  default     = ""
}

variable "create_isoseg_resources" {
  type        = "string"
  default     = "0"
  description = "Optionally create a LB and DNS entries for a single isolation segment. Valid values are 0 or 1."
}

/*******
* Tags *
********/

variable "tags" {
  type        = "map"
  default     = {}
  description = "Key/value tags to assign to all AWS resources"
}
