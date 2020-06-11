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

variable "node_name" {
    description = "Instance name for Bifrost."
    type = string
	default = "BiFrost"
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

variable "jupyter_port" {
    description = "Jupyter Notebook Port."
    type = string
	default = "8888"
}

variable "template_file" {
    description = "Installation template file."
    type = string
	default = "./installations.sh"
}

variable "vpc_name" {
	default = "midgard"
    type = string
}

variable "subnet_name" {
	default = "midgard_public_block_1"
    type = string
}

variable "sg_name" {
	default = "midgard_heimdal"
    type = string
}

variable "eip_name" {
	default = "midgard_bifrost_address"
    type = string
}