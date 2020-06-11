locals {
    common_tags = {
        project = var.project
        owner = var.user
    }
}

# AMI to use
data "aws_ami" "bifrost_ami" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# User data template
data "template_file" "bifrost_user_data_file" {
  template = file(var.template_file)
  vars = {
    v_jupyter_port = var.jupyter_port
  }
}

# Network elements to use
data "aws_subnet" "block" {
    tags = merge(
        local.common_tags,
        {
            Name = var.subnet_name
        }
    )
}

data "aws_security_group" "heimdal" {
    tags = merge(
        local.common_tags,
        {
            Name = var.sg_name
        }
    )
}

data "aws_eip" "bifrost_address" {
    tags = merge(
        local.common_tags,
        {
            Name = var.eip_name
        }
    )
}