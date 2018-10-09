resource "aws_route_table" "private_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table_association" "route_management_subnet_1" {
  subnet_id      = "${aws_subnet.management_subnet_1.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_management_subnet_2" {
  subnet_id      = "${aws_subnet.management_subnet_2.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_management_subnet_3" {
  subnet_id      = "${aws_subnet.management_subnet_3.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_pas_subnet_1" {
  subnet_id      = "${aws_subnet.pas_subnet_1.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_pas_subnet_2" {
  subnet_id      = "${aws_subnet.pas_subnet_2.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_pas_subnet_3" {
  subnet_id      = "${aws_subnet.pas_subnet_3.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_services_subnet_1" {
  subnet_id      = "${aws_subnet.services_subnet_1.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_services_subnet_2" {
  subnet_id      = "${aws_subnet.services_subnet_2.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "route_services_subnet_3" {
  subnet_id      = "${aws_subnet.services_subnet_3.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}
