# VPC
variable "vpc_cidr" {
    description = "The CIDR of my VPC"
    type = string 
}

variable "vpc_name" {
    description = "The name of the VPC"
    type = string
}

variable "region" {
    description = "Default region our VPC"
    type = string
}


# Internet Gateway
variable "Internet_gw_name" {
    description = "The name of the Internet Gateway"
    type = string
}


# Subnet
# Public
variable "public_cidr_a" {
    description = "CIDR of the public subnet in AZ A"
    type = string
}

# Subnet
# Private
variable "private_cidr_a" {
    description = "CIDR of the private subnet in AZ A"
    type = string
}

# INSTANCE
variable "instance_type" {
  description = "The type of my first server"
  type        = string
  default     = "t2.medium"
}

# Key Pair
variable "keypair_name" {
    description = "Name of my key pair on the console"
    type = string
}