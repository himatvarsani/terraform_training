data "aws_subnet" "data_subnet_1" {
  tags = {
    Name = "snet-prod-use1-data-a"
  }
}

data "aws_subnet" "data_subnet_2" {
  tags = {
    Name = "snet-prod-use1-data-b"
  }
}

data "aws_vpc" "main_vpc" {
  tags = {
    Name = "vpc-prod-use1"
  }
}

output "data_subnet_1_id" {
  value = data.aws_subnet.data_subnet_1.id
}

output "data_vpc" {
  value = data.aws_vpc.main_vpc.id
}
