variable "project" {
    description = "Parent project name"
    type = string
}

variable "user" {
    description = "Owner of the services"
    type = string
}

variable "region" {
    description = "AWS region to be used"
    type = string
}

variable "midguard_sg_id" {
    description = "Security Group ID"
    type = string
}

variable "midguard_public_subnet_ids" {
    description = "Public Subnet ID"
    type = list
}

variable "instance_type" {
    description = "Instance type for Bifrost."
    type = string
	default = "t2.micro"
}

variable "key_name" {
    description = "Key pair for Bifrost."
    type = string
	default = "mjolnir_saumalya"
}
