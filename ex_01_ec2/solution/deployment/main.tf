locals {
  prefix = "${var.region}-${var.project}"
}

resource "aws_instance" "ubuntu" {
  count           = 2
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.integrated.id]
  ami             = data.aws_ami.ubuntu.id
  tags = {
    Name = "${local.prefix}-instance-${count.index}"
  }
}

resource "aws_security_group" "integrated" {
  name     = "${local.prefix}-sg"
  vpc_id   = data.aws_vpc.default_vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = "${ingress.value.service} from specific addresses"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = var.public_cidr_blocks
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.prefix}-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}
