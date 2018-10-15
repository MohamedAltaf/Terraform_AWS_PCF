output "iaas" {
  value = "aws"
}


# Buckets ============================================

output "ops_manager_bucket" {
  value = "${module.ops_manager.bucket}"
}

output "pas_buildpacks_bucket" {
  value = "${aws_s3_bucket.buildpacks_bucket.bucket}"
}

output "pas_droplets_bucket" {
  value = "${aws_s3_bucket.droplets_bucket.bucket}"
}

output "pas_packages_bucket" {
  value = "${aws_s3_bucket.packages_bucket.bucket}"
}

output "pas_resources_bucket" {
  value = "${aws_s3_bucket.resources_bucket.bucket}"
}

output "pas_buildpacks_backup_bucket" {
  value = "${element(concat(aws_s3_bucket.buildpacks_backup_bucket.*.bucket, list("")), 0)}"
}

output "pas_droplets_backup_bucket" {
  value = "${element(concat(aws_s3_bucket.droplets_backup_bucket.*.bucket, list("")), 0)}"
}

output "pas_packages_backup_bucket" {
  value = "${element(concat(aws_s3_bucket.packages_backup_bucket.*.bucket, list("")), 0)}"
}

output "pas_resources_backup_bucket" {
  value = "${element(concat(aws_s3_bucket.resources_backup_bucket.*.bucket, list("")), 0)}"
}

output "blobstore_kms_key_id" {
  value = "${aws_kms_key.blobstore_kms_key.key_id}"
}

# Ops Manager ========================================================

output "ops_manager_public_ip" {
  value = "${module.ops_manager.public_ip}"
}

output "env_dns_zone_name_servers" {
  value = ["${compact(split(",", local.name_servers))}"]
}

output "sys_domain" {
  value = "sys.${var.env_name}.${var.dns_suffix}"
}

output "apps_domain" {
  value = "apps.${var.env_name}.${var.dns_suffix}"
}

output "tcp_domain" {
  value = "tcp.${var.env_name}.${var.dns_suffix}"
}

output "ops_manager_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.ops_manager.name}"
}

output "ops_manager_iam_user_name" {
  value = "${aws_iam_user.ops_manager.name}"
}

output "ops_manager_iam_user_access_key" {
  value = "${aws_iam_access_key.ops_manager.id}"
}

output "ops_manager_iam_user_secret_key" {
  value = "${aws_iam_access_key.ops_manager.secret}"
}

output "pas_bucket_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.pas_bucket_access.name}"
}

output "ops_manager_security_group_id" {
  value = "${module.ops_manager.security_group_id}"
}

output "vms_security_group_id" {
  value = "${aws_security_group.vms_security_group.id}"
}

output "management_1_subnet_id" {
  value = ["${aws_subnet.management_subnet_1.id}"]
}

output "management_2_subnet_id" {
  value = ["${aws_subnet.management_subnet_2.id}"]
}

output "management_3_subnet_id" {
  value = ["${aws_subnet.management_subnet_3.id}"]
}

output "management_1_subnet_cidrs" {
  value = ["${aws_subnet.management_subnet_1.cidr_block}"]
}

output "management_2_subnet_cidrs" {
  value = ["${aws_subnet.management_subnet_2.cidr_block}"]
}

output "management_3_subnet_cidrs" {
  value = ["${aws_subnet.management_subnet_3.cidr_block}"]
}

output "management_subnets" {
  value = ["${aws_subnet.management_subnet_1.id}", "${aws_subnet.management_subnet_2.id}", "${aws_subnet.management_subnet_3.id}"]
}

output "pas_1_subnet_id" {
  value = ["${aws_subnet.pas_subnet_1.id}"]
}

output "pas_2_subnet_id" {
  value = ["${aws_subnet.pas_subnet_2.id}"]
}

output "pas_3_subnet_id" {
  value = ["${aws_subnet.pas_subnet_3.id}"]
}

output "pas_1_subnet_cidrs" {
  value = ["${aws_subnet.pas_subnet_1.cidr_block}"]
}

output "pas_2_subnet_cidrs" {
  value = ["${aws_subnet.pas_subnet_2.cidr_block}"]
}

output "pas_3_subnet_cidrs" {
  value = ["${aws_subnet.pas_subnet_3.cidr_block}"]
}

output "pas_subnets" {
  value = ["${aws_subnet.pas_subnet_1.id}", "${aws_subnet.pas_subnet_2.id}", "${aws_subnet.pas_subnet_3.id}"]
}

output "services_1_subnet_id" {
  value = ["${aws_subnet.services_subnet_1.id}"]
}

output "services_2_subnet_id" {
  value = ["${aws_subnet.services_subnet_2.id}"]
}

output "services_3_subnet_id" {
  value = ["${aws_subnet.services_subnet_3.id}"]
}

output "services_1_subnet_cidrs" {
  value = ["${aws_subnet.services_subnet_1.cidr_block}"]
}

output "services_2_subnet_cidrs" {
  value = ["${aws_subnet.services_subnet_2.cidr_block}"]
}

output "services_3_subnet_cidrs" {
  value = ["${aws_subnet.services_subnet_3.cidr_block}"]
}

output "services_subnets" {
  value = ["${aws_subnet.services_subnet_1.id}", "${aws_subnet.services_subnet_2.id}", "${aws_subnet.services_subnet_3.id}"]
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "network_name" {
  value = "${aws_vpc.vpc.id}"
}

output "ops_manager_ssh_private_key" {
  sensitive = true
  value     = "${module.ops_manager.ssh_private_key}"
}

output "ops_manager_ssh_public_key_name" {
  value = "${module.ops_manager.ssh_public_key_name}"
}

output "ops_manager_ssh_public_key" {
  value = "${module.ops_manager.ssh_public_key}"
}

output "region" {
  value = "${var.region}"
}

output "azs" {
  value = "${var.availability_zones}"
}

output "web_lb_name" {
  value = "${aws_elb.web_elb.name}"
}

output "web_elb_name" {
  value = "${aws_elb.web_elb.name}"
}

output "ssl_cert_arn" {
  value = "${var.ssl_cert_arn}"
}

output "ssl_cert" {
  sensitive = true
  value     = "${length(var.ssl_ca_cert) > 0 ? element(concat(tls_locally_signed_cert.ssl_cert.*.cert_pem, list("")), 0) : var.ssl_cert}"
}

output "ssl_private_key" {
  sensitive = true
  value     = "${length(var.ssl_ca_cert) > 0 ? element(concat(tls_private_key.ssl_private_key.*.private_key_pem, list("")), 0) : var.ssl_private_key}"
}

output "ssh_lb_name" {
  value = "${aws_elb.ssh_elb.name}"
}

output "ssh_elb_name" {
  value = "${aws_elb.ssh_elb.name}"
}

output "isoseg_elb_name" {
  value = "${element(concat(aws_elb.isoseg.*.name, list("")), 0)}"
}

output "isoseg_ssl_cert" {
  sensitive = true
  value     = "${length(var.isoseg_ssl_ca_cert) > 0 ? element(concat(tls_locally_signed_cert.isoseg_ssl_cert.*.cert_pem, list("")), 0) : var.isoseg_ssl_cert}"
}

output "isoseg_ssl_private_key" {
  sensitive = true
  value     = "${length(var.isoseg_ssl_ca_cert) > 0 ? element(concat(tls_private_key.isoseg_ssl_private_key.*.private_key_pem, list("")), 0) : var.isoseg_ssl_private_key}"
}

output "dns_zone_id" {
  value = "${local.zone_id}"
}

output "ops_manager_ip" {
  value = "${module.ops_manager.ops_manager_private_ip}"
}

output "ops_manager_private_ip" {
  value = "${module.ops_manager.ops_manager_private_ip}"
}
