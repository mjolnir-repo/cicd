resource "aws_security_group" "midgard_heimdal_default" {
    name        = "midguard_heimdal"
    description = "Control inbound and outbound traffic"
    vpc_id      = aws_vpc.midgard.id
    tags = merge(
        local.common_tags,
        {
            Name = var.security_group_name
        }
    )

    ingress {
        description = "All traffic from VPC"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [var.vpc_cidr]
    }

    ingress {
        description = "All traffic from whitelisted IPs"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = var.whitelisted_ips
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}