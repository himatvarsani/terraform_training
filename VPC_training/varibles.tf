#VPC
variable "vpc_cidr" {
  description = "The CIDR of my VPC"
  type = string
}

#subnet
variable "vpc_name" {
  description = "The name of my VPC"
  type = string
}

#Internet Gateway
variable "internet_gw_name" {
  description = "The name of my Internet Gateway"
  type = string
}

#PUBLIC SUBNET
variable "public_cidr_a" {
  description = "CIDR of the public Subet cidr_a"
  type = string
}

variable "public_cidr_b" {
  description = "CIDR of the public Subet cidr_b"
  type = string
}

variable "public_cidr_c" {
  description = "CIDR of the public Subet cidr_c"
  type = string
}

#PRIVATE SUBNET
variable "private_cidr_a" {
  description = "CIDR of the private Subet cidr_a"
  type = string
}

variable "private_cidr_b" {
  description = "CIDR of the private Subet cidr_b"
  type = string
}

variable "private_cidr_c" {
  description = "CIDR of the private Subet cidr_c"
  type = string
}

variable "region" {
  description = "Default region for our VPC"
  type = string
}

#INSTANCE
variable "instance_type" {
  description = "The type of my first server"
  type = string
  default = "t2.medium"
}

variable "keypair_name" {
  description = "The key pair name"
  type = string
}