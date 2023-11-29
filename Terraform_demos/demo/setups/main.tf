provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}

module "himat_webserver" {
    source = ".../modules/webserver"
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.0.0/16"
    webserver_name = "himat"
    ami = "ami-003634241a8fcdec0"
    instance_type = "t2.medium"
}

resource "aws_elb" "main" {
    instances = module.himat_webserver.instance.id
}