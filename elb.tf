resource "aws_elb" "web_elb" {
  name                      = "${var.env_name}-web-elb"
  cross_zone_load_balancing = true

  health_check {
    healthy_threshold   = 6
    unhealthy_threshold = 3
    interval            = 5
    target              = "HTTP:8080/health"
    timeout             = 3
  }

  idle_timeout = 3600

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${length(var.ssl_cert_arn) > 0 ? var.ssl_cert_arn : element(concat(aws_iam_server_certificate.cert.*.arn, list("")), 0)}"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "tcp"
    lb_port            = 4443
    lb_protocol        = "ssl"
    ssl_certificate_id = "${length(var.ssl_cert_arn) > 0 ? var.ssl_cert_arn : element(concat(aws_iam_server_certificate.cert.*.arn, list("")), 0)}"
  }

  security_groups = ["${aws_security_group.elb_security_group.id}"]
  subnets         = ["${aws_subnet.management_subnet_1.id}", "${aws_subnet.management_subnet_2.id}", "${aws_subnet.management_subnet_3.id}"]
}

resource "aws_elb" "ssh_elb" {
  name                      = "${var.env_name}-ssh-elb"
  cross_zone_load_balancing = true

  health_check {
    healthy_threshold   = 6
    unhealthy_threshold = 3
    interval            = 5
    target              = "TCP:2222"
    timeout             = 3
  }

  idle_timeout = 3600

  listener {
    instance_port     = 2222
    instance_protocol = "tcp"
    lb_port           = 2222
    lb_protocol       = "tcp"
  }

  security_groups = ["${aws_security_group.ssh_elb_security_group.id}"]
  subnets         = ["${aws_subnet.management_subnet_1.id}", "${aws_subnet.management_subnet_2.id}", "${aws_subnet.management_subnet_3.id}"]
}

resource "aws_elb" "isoseg" {
  count = "${var.create_isoseg_resources}"

  name                      = "${var.env_name}-isoseg-elb"
  cross_zone_load_balancing = true

  health_check {
    healthy_threshold   = 6
    unhealthy_threshold = 3
    interval            = 5
    target              = "HTTP:8080/health"
    timeout             = 3
  }

  idle_timeout = 3600

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${aws_iam_server_certificate.isoseg_cert.arn}"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "tcp"
    lb_port            = 4443
    lb_protocol        = "ssl"
    ssl_certificate_id = "${aws_iam_server_certificate.isoseg_cert.arn}"
  }

  security_groups = ["${aws_security_group.isoseg_elb_security_group.id}"]
  subnets         = ["${aws_subnet.management_subnet_1.id}", "${aws_subnet.management_subnet_2.id}", "${aws_subnet.management_subnet_3.id}"]

  tags = "${merge(var.tags, local.default_tags)}"
}
