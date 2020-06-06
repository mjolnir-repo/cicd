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

variable "vpc_cidr" {
	default = "75.57.0.0/22"
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

variable "azs" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}

variable "whitelisted_ips" {
	type = list
	default = ["103.218.170.40/32", "42.110.129.206/32"]
}
