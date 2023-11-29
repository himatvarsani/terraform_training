data "aws_vpc" "mainVPC" {
  filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }


}

data "aws_subnet" "subnet_app_A" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-application-a"]
  }
}

data "aws_kms_key" "customerKey" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

output "vpc_id" {
  value = data.aws_vpc.mainVPC.id

}