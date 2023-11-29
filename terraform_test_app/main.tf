# configure aws provider
provider "aws" {
    region      = var.region
    profile     = "cloudreach-ta-lab"
}

# create vpc to reference the vpc module
module "vpc" {
    # source is where you would load the module from
    source                              = "git::https://github.com/himatvarsani-cloudreach/aws_modules_VPC.git?ref=v1.0.0"
    region                              = var.region
    project_name                        = var.project_name
    vpc_cidr                            = var.vpc_cidr
    public_subnet_az1_cidr              = var.public_subnet_az1_cidr
    public_subnet_az2_cidr              = var.public_subnet_az2_cidr
    private_app_subnet_az1_cidr         = var.private_app_subnet_az1_cidr
    private_app_subnet_az2_cidr         = var.private_app_subnet_az2_cidr
    private_data_subnet_az1_cidr        = var.private_data_subnet_az1_cidr
    private_data_subnet_az2_cidr        = var.private_data_subnet_az2_cidr
}