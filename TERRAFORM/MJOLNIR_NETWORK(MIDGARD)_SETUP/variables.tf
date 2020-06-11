variable "project" {
    description = "Parent project name"
    type = string
    default = "mjolnir"
}

variable "user" {
    description = "Owner of the services"
    type = string
    default = "mjolnir_saumalya"
}

variable "region" {
    description = "AWS region to be used"
    type = string
    default = "us-east-1"
}

variable "remote_state_location_bucket" {
    description = "Name of the bucket to keep all .tfstate files"
    type = string
    default = "mjolnir-cicd-terraform-remote-state-location"
}

variable "remote_state_lock_table" {
    description = "DynamoDB table name to enforce .tfstate files"
    type = string
    default = "mjolnir-cicd-terraform-state-lock-dynamo-collection"
}

variable "vpc_cidr" {
	default = "75.57.0.0/22"
    type = string
}

variable "vpc_name" {
	default = "midgard"
    type = string
}

variable "public_block_prefix" {
	default = "midgard_public_block"
    type = string
}

variable "private_block_prefix" {
	default = "midgard_private_block"
    type = string
}

variable "public_subnets_cidr" {
	type = list
	default = ["75.57.0.0/24", "75.57.1.0/24"]
}

variable "private_subnets_cidr" {
	type = list
	default = ["75.57.2.0/24", "75.57.3.0/24"]
}

variable "public_route_table_name" {
	default = "midgard_public_gate"
    type = string
}

variable "private_route_table_name" {
	default = "midgard_private_gate"
    type = string
}

variable "azs" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}

variable "whitelisted_ips" {
	type = list
	default = ["103.218.170.40/32", "42.110.129.206/32"]
}

variable "bifrost_eip_name" {
	default = "midgard_bifrost_address"
    type = string
}

variable "security_group_name"{
	default = "midgard_heimdal"
    type = string
}