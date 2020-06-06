# Define Node
resource "aws_instance" "bifrost" {
    ami = data.aws_ami.bifrost_ami.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.midguard_sg_id]
    subnet_id = element(var.midguard_public_subnet_ids, 0)
    associate_public_ip_address = true

    tags = {
        Name = "bifrost"
        project = var.project
        owner = var.user
    }
}

# Add EIP creation to midguard set up
# resource "aws_eip" "bifrost_eip" {
#   instance = "${aws_instance.bifrost.id}"
#   vpc      = true
# }