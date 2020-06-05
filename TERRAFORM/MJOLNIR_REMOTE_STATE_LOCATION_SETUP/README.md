## Introduction
To deploy a `S3` bucket, which will hold all `.tfstate` (terraform state file) for `Mjolnir` project.

## Pre-Requisite
#### Please skip these steps, if already done.
 1. Install `terraform`
 2. Configure AWS keys:
	 1. `export  AWS_ACCESS_KEY_ID=<Your AWS Access Key>`
	 2. `export AWS_SECRET_ACCESS_KEY=<Your AWS Secret Key>`
3. Initiate `terraform` providers using `terraform init`

## Usage Instruction
To launch the Launch the bucket, use
> `terraform apply`

To launch the bucket with custom bucket name or region name, use any of the following:
> `terraform apply -var remote_state_location_region=<you choice of region> ...`

or
> `export TF_VAR_remote_state_location_region=<Your choice of region>`
> ...
> terraform apply

#### That's all folks!!
