locals {
  setup_name = "tuts"
}

/*
provider "aws" {
    alias = "east"
    region = "us-east-1"
}

resource "aws_instance" "web_east" {
    // provider<aws>.east<alias>
    provider = aws.east
    ami = "ami-085925f297f89fcel"
    instance_type = "t2.micro"

    tags = {
        Name = "East Test"
    }
}
*/

# locals.variable name (setup_name) -- locals.setup_name

# data "aws_ami" "main_ami" {
#   most_recent = true
#   owners = ["self"]
# }

/*
data "aws_vpc" "tuts" {
    filter {
      name = "tag:Name"
      values = ["tuts-vpc"]
    }
}
*/

resource "aws_vpc" "main" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.setup_name}-vpc"
  }

}

resource "aws_subnet" "web" {
  # vpc_id <resource name>.<attribute name>
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.5.0.0/16"
  map_public_ip_on_launch = true

  tags = {
    Name = "web-subnet"
  }
}

resource "aws_instance" "web" {

    // COUNT
    // count = 2 - creates a 2 instances 

    // FOR EACH
    for_each = {
        prod = "t2.large"
        dev = "t2.micro"
    }

    ami           = "ami-08ca3fed11864d6bb"
    //ami = data.aws_ami.main_ami.id

    //instance_type = each.value
    instance_type = var.my_instance_type
    subnet_id = aws_subnet.web.id
    
    /*
    tags = {
        Name = "Instance Test1"
        }
    */
    tags = var.instance_tags

    /* A tag for the count (count = 2) - creates a Test 1, Test 2 etc
    tags = {
        //Test 1 (Count = 1), Test 2 (count = 2)
        Name = "Test ${count.index}"
    }
    */

     /* A tag For Each
    tags = {
        //Test prod and Test dev - as per the for each
        Name = "Test ${each.key}"
    }
    */
}