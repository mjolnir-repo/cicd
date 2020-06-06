# VPC Outputs
output "midguard_arn" {
  value = module.midguard.midguard_arn
  description = "The ARN of the VPC"
}

output "midguard_id" {
  value = module.midguard.midguard_id
  description = "The ID of the VPC"
}

output "midguard_cidr_block" {
  value = module.midguard.midguard_cidr_block
  description = "The CIDR block of the VPC"
}


# Subnet Outputs
output "midguard_public_subnet_ids" {
  value = module.midguard.midguard_public_subnet_ids
  description = "IDs of Public Subnets"
}

output "midguard_public_subnet_arns" {
  value = module.midguard.midguard_public_subnet_arns
  description = "ARNs of Public Subnets"
}
output "midguard_private_subnet_ids" {
  value = module.midguard.midguard_private_subnet_ids
  description = "IDs of Private Subnets"
}

output "midguard_private_subnet_arns" {
  value = module.midguard.midguard_private_subnet_arns
  description = "ARNs of Private Subnets"
}


# Internet gateway outputs
output "midguard_igw_id" {
  value = module.midguard.midguard_igw_id
  description = "ID of Internet Gateway"
}


# Security Group outputs
output "midguard_sg_id" {
  value = module.midguard.midguard_sg_id
  description = "ID of Multipurpose Security Group"
}

output "midguard_sg_arn" {
  value = module.midguard.midguard_sg_arn
  description = "ARN of Multipurpose Security Group"
}

output "midguard_sg_ingress" {
  value = module.midguard.midguard_sg_ingress
  description = "Allowed inbound rules of Multipurpose Security Group"
}

output "midguard_sg_egress" {
  value = module.midguard.midguard_sg_egress
  description = "Allowed outbound rules of Multipurpose Security Group"
}


# EC2 Outputs
output "bifrost_arn" {
  value       = module.bifrost.bifrost_arn
  description = "The ARN of the Master Node"
}

output "bifrost_id" {
  value       = module.bifrost.bifrost_id
  description = "The ID of the Master Node"
}

output "bifrost_dns" {
  value       = module.bifrost.bifrost_dns
  description = "Public DNS of the Master Node"
}

output "bifrost_ip" {
  value       = module.bifrost.bifrost_ip
  description = "Public IP of the Master Node"
}
