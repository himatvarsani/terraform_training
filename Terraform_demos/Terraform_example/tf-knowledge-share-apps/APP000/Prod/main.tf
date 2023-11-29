locals {
  tags = {
    Env        = "Prod"
    Department = "IT"
    AppID      = "APP000"
  }
}

data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }
}

data "aws_subnet" "app_subnet" {
  tags = {
    Name = "snet-prod-use1-application-a"
  }
}

data "aws_subnet" "app_subnet_b" {
  tags = {
    Name = "snet-prod-use1-application-b"
  }
}

data "aws_subnet" "db_subnet_a" {
  tags = {
    Name = "snet-prod-use1-data-a"
  }
}

data "aws_subnet" "public_subnet_a" {
  tags = {
    Name = "snet-prod-use1-public-a"
  }
}

data "aws_subnet" "public_subnet_b" {
  tags = {
    Name = "snet-prod-use1-public-b"
  }
}

data "aws_security_group" "global_sg" {
  tags = {
    Name = "hands-on-global-sg"
  }
}

data "aws_kms_key" "kms_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

data "aws_key_pair" "main_key_pair" {
  key_name           = "hands-on"
  include_public_key = true
}

# #Test
# output "vpc_name" {
#   value = data.aws_vpc.main_vpc
# }

# output "subnet_name" {
#   value = data.aws_subnet.app_subnet
# }

# output "aws_kms_key" {
#   value = data.aws_kms_key.kms_key
# }

# output "aws_security_group" {
#   value = data.aws_security_group.global_sg
# }