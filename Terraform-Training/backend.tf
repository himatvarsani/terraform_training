terraform {
  backend "s3" {
      bucket = "talent-academy-139446191400-tfstates"
      key = "sprint1/week3/training-terraform/terraform.tfstate"
      dynamodb_table = "terraform-lock" # Doesn't allow to make changes until a user has completed with change
  }
}