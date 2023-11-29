variable "resource_group" {
  default = "hm_vnet"
}

variable "location" {
  default = "eastus"
}

variable "vnet_name" {
  default = "vm_test"
}

variable "address_space" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = ["subnet-1", "subnet-2", "subnet-3"]
}

variable "subnet_prefix" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "create_subnet" {
  type    = bool
  default = false
}