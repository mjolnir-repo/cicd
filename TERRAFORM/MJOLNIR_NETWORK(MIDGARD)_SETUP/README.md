## Introduction

To deploy network elements for `Mjolnir` project. Network services are:

1. `vpc`
2. `subnets`
3. `route tables`
4. `internet gateway`
5. `security group`(multipurpose one)

  

## Pre-Requisite

#### Please skip these steps, if already done.

1. Install `terraform`

2. Configure AWS keys:

3.  `export AWS_ACCESS_KEY_ID=<Your AWS Access Key>`

4.  `export AWS_SECRET_ACCESS_KEY=<Your AWS Secret Key>`

5. Initiate `terraform` providers using `terraform init`
6. Make sure remote state file location set up is done. Or else follow the `MJOLNIR/CICD/MJOLNIR_REMOTE_STATE_LOCATION_SETUP/README.md` file. 

  

## Usage Instruction

To launch the Launch the bucket, use

>  `terraform apply`

  

To launch the bucket with custom bucket name or region name, use any of the following:

>  `terraform apply -var region=<you choice of region> ...`

  

or

>  `export TF_VAR_region=<Your choice of region>`

> ...

> terraform apply

  

#### That's all folks!!