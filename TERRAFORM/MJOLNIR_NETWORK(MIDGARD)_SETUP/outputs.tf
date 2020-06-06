# VPC Outputs
output "midguard_arn" {
  value       = aws_vpc.midguard.arn
  description = "The ARN of the VPC"
}

output "midguard_id" {
  value       = aws_vpc.midguard.id
  description = "The ID of the VPC"
}

output "midguard_cidr_block" {
  value       = aws_vpc.midguard.cidr_block
  description = "The CIDR block of the VPC"
}


# Subnet Outputs
output "midguard_public_subnet_ids" {
  value       = aws_subnet.midguard_public_blocks.*.id
  description = "IDs of Public Subnets"
}

output "midguard_public_subnet_arns" {
  value       = aws_subnet.midguard_public_blocks.*.arn
  description = "ARNs of Public Subnets"
}
output "midguard_private_subnet_ids" {
  value       = aws_subnet.midguard_private_blocks.*.id
  description = "IDs of Private Subnets"
}

output "midguard_private_subnet_arns" {
  value       = aws_subnet.midguard_private_blocks.*.arn
  description = "ARNs of Private Subnets"
}


# Internet gateway outputs
output "midguard_igw_id" {
  value       = aws_internet_gateway.midguard_tunnel.id
  description = "ID of Internet Gateway"
}


# Security Group outputs
output "midguard_sg_id" {
  value       = aws_security_group.midguard_heimdal_default.id
  description = "ID of Multipurpose Security Group"
}

output "midguard_sg_arn" {
  value       = aws_security_group.midguard_heimdal_default.arn
  description = "ARN of Multipurpose Security Group"
}

output "midguard_sg_ingress" {
  value       = aws_security_group.midguard_heimdal_default.ingress
  description = "Allowed inbound rules of Multipurpose Security Group"
}

output "midguard_sg_egress" {
  value       = aws_security_group.midguard_heimdal_default.egress
  description = "Allowed outbound rules of Multipurpose Security Group"
}
