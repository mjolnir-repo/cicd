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

variable "jupyter_port" {
    description = "Jupyter Notebook Port."
    type = string
	default = "8888"
}

variable "template_file" {
    description = "Installation template file."
    type = string
	default = "./MJOLNIR_MASTER_NODE(BIFROST)_SETUP/installations.sh"
}

variable "midguard_bifrost_eip_id" {
    description = "EIP id."
    type = string
}