variable "remote_state_location_region" {
    description = "AWS region to be used"
    type        = string
    default     = "us-east-1"
}

variable "remote_state_location_bucket" {
    description = "Name of the bucket to keep all .tfstate files"
    type        = string
    default     = "mjolnir-cicd-terraform-remote-state-location"
}