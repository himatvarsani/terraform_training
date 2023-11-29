terraform {
  backend "s3" {
      #copy the url from the aws cli - bucket
    bucket = "ring-challenge-139446191400-tfstates"
    key    = "sprint2/week3/ring_challenge/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}