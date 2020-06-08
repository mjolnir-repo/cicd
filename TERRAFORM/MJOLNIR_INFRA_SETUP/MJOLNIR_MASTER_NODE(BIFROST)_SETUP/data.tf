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