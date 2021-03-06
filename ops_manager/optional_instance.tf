resource "aws_instance" "optional_ops_manager" {
  ami                    = "${var.optional_ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.ops_manager_security_group.id}"]
  source_dest_check      = false
  subnet_id              = "${var.subnet_id}"
  iam_instance_profile   = "${var.instance_profile_name}"
  count                  = "${var.optional_count}"

  root_block_device {
    volume_type = "gp2"
    volume_size = 150
  }

  tags = "${merge(var.tags, var.default_tags,
    map("Name", "${var.env_name}-optional-ops-manager")
  )}"

}
