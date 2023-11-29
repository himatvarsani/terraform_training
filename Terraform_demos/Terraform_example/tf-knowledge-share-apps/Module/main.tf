locals {
  tags = {
    Env        = var.environment
    Department = "IT"
    AppID      = var.app_id
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
    Name = "snet-prod-use1-application-${var.az[0]}"
  }
}

data "aws_subnet" "app_subnet_2" {
  tags = {
    Name = "snet-prod-use1-application-${var.az[1]}"
  }
}

data "aws_subnet" "db_subnet" {
  tags = {
    Name = "snet-prod-use1-data-${var.az[2]}"
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
