# EC2 VARIABLES
variable "app_instance_type" {
  type    = string
  default = null
}

variable "db_instance_type" {
  type    = string
  default = null
}

variable "app_ebs_root_size" {
  type    = number
  default = null
}

variable "db_ebs_root_size" {
  type    = number
  default = null
}

variable "environment" {
  default = null
  type    = string
}

variable "region" {
  description = "Region the resource will be deployed. Example 'us-east-1'"
  type        = string
  default     = null
}

variable "ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-026b57f3c383c2eec"
}

variable "key_name" {
  description = "SSH Key"
  type        = string
  default     = "hands-on"
}

variable "encrypted" {
  description = "EBS Encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "Encription Key"
  type        = string
  default     = null
}

# ENIS
variable "private_ips" {
  type    = list(any)
  default = null
}

variable "app_id" {
  type    = string
  default = null
}

variable "az" {
  description = "AZ to deploy instances"
  type        = list(any)
  default     = ["a", "b", "a"]
}

variable "ebs_size" {
  type = map(any)
  default = {
    app_1_ebs = null,
    app_2_ebs = null,
    db_ebs    = null
  }
}

variable "ebs_type" {
  type = map(any)
  default = {
    app_1_ebs = null,
    app_2_ebs = null,
    db_ebs    = null
  }
}