# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket  = "terraform-remote-state-787786425565"
    key     = "jupiter-website-ecs.tfstate"
    region  = "eu-west-1"
    profile = "cloudreach-ta-lab"
  }
}