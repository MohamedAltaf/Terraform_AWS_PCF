resource "aws_subnet" "management_subnet_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.management_cidr_1}"

  tags = "${merge(var.tags, local.default_tags,
    map("Name", "${var.env_name}-management-subnet-1")
  )}"
}

resource "aws_subnet" "management_subnet_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.management_cidr_2}"

  tags = "${merge(var.tags, local.default_tags,
    map("Name", "${var.env_name}-management-subnet-2")
  )}"
}

resource "aws_subnet" "management_subnet_3" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.management_cidr_3}"

  tags = "${merge(var.tags, local.default_tags,
    map("Name", "${var.env_name}-management-subnet-3")
  )}"
}

resource "aws_subnet" "pas_subnet_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.pas_cidr_1}"

  tags {
    Name = "${var.env_name}-ert-subnet-1}"
  }
}

resource "aws_subnet" "pas_subnet_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.pas_cidr_2}"

  tags {
    Name = "${var.env_name}-ert-subnet-2}"
  }
}

resource "aws_subnet" "pas_subnet_3" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.pas_cidr_3}"

  tags {
    Name = "${var.env_name}-ert-subnet-3}"
  }
}

resource "aws_subnet" "services_subnet_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.services_cidr_1}"

  tags = "${merge(var.tags, local.default_tags,
    map("Name", "${var.env_name}-services-subnet-1")
  )}"
}

resource "aws_subnet" "services_subnet_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.services_cidr_2}"

  tags = "${merge(var.tags, local.default_tags,
    map("Name", "${var.env_name}-services-subnet-2")
  )}"
}

resource "aws_subnet" "services_subnet_3" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.services_cidr_3}"

  tags = "${merge(var.tags, local.default_tags,
    map("Name", "${var.env_name}-services-subnet-3")
  )}"
}
