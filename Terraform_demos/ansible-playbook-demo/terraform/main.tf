module "network" {
    # The module network - Pascal repository
    source = "github.com/pasc-ed/talent-academy-vpc-module"
    vpc_cidr         = var.vpc_cidr
    vpc_name         = var.vpc_name
    region           = var.region
    internet_gw_name = var.internet_gw_name
    public_a_cidr    = var.public_cidr_a
    private_a_cidr   = var.private_cidr_a
    
}