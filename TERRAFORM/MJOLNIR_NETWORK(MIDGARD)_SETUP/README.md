## Usage Instruction
#### Please skip these steps, if already done.

1. Install `terraform`

2. Configure AWS keys:

3.  `export AWS_ACCESS_KEY_ID=<Your AWS Access Key>`

4.  `export AWS_SECRET_ACCESS_KEY=<Your AWS Secret Key>`

5. Initiate `terraform` providers using `terraform init`

## Requirement

#### To deploy network elements for `Mjolnir` project. Network services are:

1. `vpc`
2. `subnets`
3. `route tables`
4. `internet gateway`
5. `security group`(multipurpose one)

## Usage Instruction  

#### First check Terraform paln

> `terraform paln`

#### To launch the infrastructure, use

>  `terraform apply`

#### To launch the with custom variables, use any of the following:

>  `terraform apply -var region=<you choice of region> ...`

#### or

>  `export TF_VAR_region=<Your choice of region>`

> ...

> `terraform apply`

### That's all folks!!