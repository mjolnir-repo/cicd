# VPC Outputs
output "midgard_arn" {
  value = aws_vpc.midgard.arn
  description = "The ARN of the VPC"
}

output "midgard_id" {
  value = aws_vpc.midgard.id
  description = "The ID of the VPC"
}

output "midgard_cidr_block" {
  value = aws_vpc.midgard.cidr_block
  description = "The CIDR block of the VPC"
}


# Subnet Outputs
output "midgard_public_subnet_ids" {
  value = aws_subnet.midgard_public_blocks.*.id
  description = "IDs of Public Subnets"
}

output "midgard_public_subnet_arns" {
  value = aws_subnet.midgard_public_blocks.*.arn
  description = "ARNs of Public Subnets"
}
output "midgard_private_subnet_ids" {
  value = aws_subnet.midgard_private_blocks.*.id
  description = "IDs of Private Subnets"
}

output "midgard_private_subnet_arns" {
  value = aws_subnet.midgard_private_blocks.*.arn
  description = "ARNs of Private Subnets"
}


# Internet gateway outputs
output "midgard_igw_id" {
  value = aws_internet_gateway.midgard_tunnel.id
  description = "ID of Internet Gateway"
}


# Security Group outputs
output "midgard_sg_id" {
  value = aws_security_group.midgard_heimdal_default.id
  description = "ID of Multipurpose Security Group"
}

output "midgard_sg_arn" {
  value = aws_security_group.midgard_heimdal_default.arn
  description = "ARN of Multipurpose Security Group"
}

output "midgard_sg_ingress" {
  value = aws_security_group.midgard_heimdal_default.ingress
  description = "Allowed inbound rules of Multipurpose Security Group"
}

output "midgard_sg_egress" {
  value = aws_security_group.midgard_heimdal_default.egress
  description = "Allowed outbound rules of Multipurpose Security Group"
}


# EIP ouputs
output "midgard_bifrost_eip_id" {
  value       = aws_eip.midgard_bifrost_eip.id
  description = "EIP ID of the Master Node"
}

output "midgard_bifrost_eip_ip" {
  value       = aws_eip.midgard_bifrost_eip.public_ip
  description = "EIP IP of the Master Node"
}

output "midgard_bifrost_eip_dns" {
  value       = aws_eip.midgard_bifrost_eip.public_dns
  description = "EIP DNS of the Master Node"
}