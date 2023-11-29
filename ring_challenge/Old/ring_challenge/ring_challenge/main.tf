# resource "aws_s3_bucket" "my_challenge_bucket" {
#   bucket = "ring-challenge-139446191400-tfstates"
#   versioning {
#     enabled = true
#   }

#   tags = {
#     Name        = "talent-academy--ring-challenge-tfstates"
#     Environment = "Test"
#   }
# }

resource "aws_vpc" "main_vpc" {
    #copy the ip address from the vpc diagram - main vpc - 192.168.0.0/16
  cidr_block = var.vpc_cidr

  tags = {
      name = var.vpc_name
  }
}

 #ELASTIC NAT GATEWAY A
resource "aws_eip" "nat_a_eip" {
  #instance = aws_instance.web.id
  vpc      = true
}

resource "aws_internet_gateway" "internet_gateway" {
   vpc_id = aws_vpc.main_vpc.id

   tags = {
     Name = var.internet_gw_name
   }
 }


#PUBLIC NAT GATEWAY A
resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "PUBLIC A NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

#PUBLIC
resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_cidr_a
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-a"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_cidr_1
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "ring-challenge-private"
  }
}

data "local_file" "private_key" {
    filename = "/Users/himat.varsani/.ssh/ring_keypair.pem"
}

