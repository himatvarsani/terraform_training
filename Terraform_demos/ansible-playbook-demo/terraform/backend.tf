terraform {
  backend "s3" {
      bucket = "ansible-playbook-139446191400-tfstate"
      key = "ansible-playbook/terraform.tfstates"
  }
}