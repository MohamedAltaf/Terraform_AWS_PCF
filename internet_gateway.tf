resource "aws_vpn_gateway" "vpng" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = "${merge(var.tags, local.default_tags)}"
}
