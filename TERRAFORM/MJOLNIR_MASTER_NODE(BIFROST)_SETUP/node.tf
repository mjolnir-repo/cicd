# Define Node
resource "aws_instance" "bifrost" {
    ami = data.aws_ami.bifrost_ami.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [data.aws_security_group.heimdal.id]
    subnet_id = data.aws_subnet.block.id
    associate_public_ip_address = true
    user_data = data.template_file.bifrost_user_data_file.rendered
    tags = merge(
        local.common_tags,
        {
            Name = var.node_name
        }
    )
}

resource "aws_eip_association" "bifrost_eip_assoc" {
    instance_id   = aws_instance.bifrost.id
    allocation_id = data.aws_eip.bifrost_address.id
}