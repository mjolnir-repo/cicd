# Define Node
resource "aws_instance" "bifrost" {
    ami = data.aws_ami.bifrost_ami.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.midguard_sg_id]
    subnet_id = element(var.midguard_public_subnet_ids, 0)
    associate_public_ip_address = true
    user_data = data.template_file.bifrost_user_data_file.rendered

    tags = {
        Name = "bifrost"
        project = var.project
        owner = var.user
    }
}

resource "aws_eip_association" "bifrost_eip_assoc" {
    instance_id   = aws_instance.bifrost.id
    allocation_id = var.midguard_bifrost_eip_id
}