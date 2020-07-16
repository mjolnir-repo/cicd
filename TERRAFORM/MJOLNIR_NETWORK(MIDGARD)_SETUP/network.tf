# Define VPC
locals {
    common_tags = {
        project = var.project
        owner = var.user
    }
}
resource "aws_vpc" "midgard" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = merge(
        local.common_tags,
        {
            Name = var.vpc_name
        }
    )
}

# Define Internet Gateway
resource "aws_internet_gateway" "midgard_tunnel" {
    vpc_id = aws_vpc.midgard.id
    tags = merge(
        local.common_tags,
        {
            Name = "midgard_tunnel"
        }
    )
}

#Define Public Subnets
resource "aws_subnet" "midgard_public_blocks" {
    count = length(var.public_subnets_cidr)
    vpc_id = aws_vpc.midgard.id
    cidr_block = element(var.public_subnets_cidr, count.index)
    availability_zone = element(var.azs, count.index)
    tags = merge(
        local.common_tags,
        {
            Name = join("_", [var.public_block_prefix, count.index+1])
        }
    )
}

#Define Private Subnets
resource "aws_subnet" "midgard_private_blocks" {
    count = length(var.private_subnets_cidr)
    vpc_id = aws_vpc.midgard.id
    cidr_block = element(var.private_subnets_cidr, count.index)
    availability_zone = element(var.azs, count.index)
    tags = merge(
        local.common_tags,
        {
            Name = join("_", [var.private_block_prefix, count.index+1])
        }
    )
}

# Define Public Route Table
resource "aws_route_table" "midgard_public_gate" {
    vpc_id = aws_vpc.midgard.id
    tags = merge(
        local.common_tags,
        {
            Name = var.public_route_table_name
        }
    )

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.midgard_tunnel.id
    }
}

# Route table association with public subnets
resource "aws_route_table_association" "midgard_public_gate_pass" {
    count = length(var.public_subnets_cidr)
    subnet_id = element(aws_subnet.midgard_public_blocks.*.id, count.index)
    route_table_id = aws_route_table.midgard_public_gate.id
}

# Define Private Route Table
resource "aws_route_table" "midgard_private_gate" {
    vpc_id = aws_vpc.midgard.id
    tags = merge(
        local.common_tags,
        {
            Name = var.private_route_table_name
        }
    )
}

# Route table association with private subnets
resource "aws_route_table_association" "midgard_private_gate_pass" {
    count = length(var.private_subnets_cidr)
    subnet_id = element(aws_subnet.midgard_private_blocks.*.id, count.index)
    route_table_id = aws_route_table.midgard_private_gate.id
}

# Create EIP
resource "aws_eip" "midgard_bifrost_eip" {
    vpc = true
    tags = merge(
        local.common_tags,
        {
            Name = var.bifrost_eip_name
        }
    )
}