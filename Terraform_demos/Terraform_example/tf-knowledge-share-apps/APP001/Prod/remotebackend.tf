terraform {
  backend "s3" {
    bucket         = "tf-learnings"
    key            = "tf-states/app01/terraform.tfstate"
    dynamodb_table = "tf_backend"
    region         = "us-east-1"
  }
}