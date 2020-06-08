# Define VPC
resource "aws_vpc" "midguard" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "bifrost"
        project = var.project
        owner = var.user
    }
}

# Define Internet Gateway
resource "aws_internet_gateway" "midguard_tunnel" {
    vpc_id = aws_vpc.midguard.id

    tags = {
        Name = "midguard_tunnel"
        project = var.project
        owner = var.user
    }
}

#Define Public Subnets
resource "aws_subnet" "midguard_public_blocks" {
    count = length(var.public_subnets_cidr)
    vpc_id = aws_vpc.midguard.id
    cidr_block = element(var.public_subnets_cidr, count.index)
    availability_zone = element(var.azs, count.index)
    tags = {
        Name = "midguard_public_block_${count.index+1}"
        project = var.project
        owner = var.user
    }
}

#Define Private Subnets
resource "aws_subnet" "midguard_private_blocks" {
    count = length(var.private_subnets_cidr)
    vpc_id = aws_vpc.midguard.id
    cidr_block = element(var.private_subnets_cidr, count.index)
    availability_zone = element(var.azs, count.index)
    tags = {
        Name = "midguard_private_block_${count.index+1}"
        project = var.project
        owner = var.user
    }
}

# Define Public Route Table
resource "aws_route_table" "midguard_public_gate" {
    vpc_id = aws_vpc.midguard.id

    tags = {
        Name = "midguard_public_gate"
        project = var.project
        owner = var.user
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.midguard_tunnel.id
    }
}

# Route table association with public subnets
resource "aws_route_table_association" "midguard_public_gate_pass" {
    count = length(var.public_subnets_cidr)
    subnet_id = element(aws_subnet.midguard_public_blocks.*.id, count.index)
    route_table_id = aws_route_table.midguard_public_gate.id
}

# Define Private Route Table
resource "aws_route_table" "midguard_private_gate" {
    vpc_id = aws_vpc.midguard.id

    tags = {
        Name = "midguard_private_gate"
        project = var.project
        owner = var.user
    }
}

# Route table association with private subnets
resource "aws_route_table_association" "midguard_private_gate_pass" {
    count = length(var.private_subnets_cidr)
    subnet_id = element(aws_subnet.midguard_private_blocks.*.id, count.index)
    route_table_id = aws_route_table.midguard_private_gate.id
}

# Create EIP
resource "aws_eip" "midguard_bifrost_eip" {
    vpc = true

    tags = {
        Name = "midguard_bifrost_eip"
        project = var.project
        owner = var.user
    }
}