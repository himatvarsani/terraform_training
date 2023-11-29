variable "vpc_id" {
    type = string
    description = "VPC Id"
}

variable "cidr_block" {
    type = string
    description = "subnet cidr block"
}

variable "webserver_name" {
    type = string
    description = "Name of webserver"
}

variable "ami" {
    type = string
    description = "AMI to use the webserver instance"
}

variable "instance_type" {
    type = string
    description = "instance type"
    default = "t2.micro"
}