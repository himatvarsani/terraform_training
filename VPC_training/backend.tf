terraform {
  backend "s3" {
      #copy the url from the aws cli - bucket
    bucket = "talent-academy-139446191400-tfstates"
    key    = "sprint2/week3/VPC/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}