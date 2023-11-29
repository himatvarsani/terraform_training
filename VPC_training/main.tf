resource "aws_vpc" "main_vpc" {
    #copy the ip address from the vpc diagram - main vpc - 192.168.0.0/16
  cidr_block = var.vpc_cidr

  tags = {
      name = var.vpc_name
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.internet_gw_name
  }
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

resource "aws_subnet" "public_b" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_cidr_b
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_cidr_c
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-c"
  }
}

#PRIVATE
resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_cidr_a
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "talent-academy-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_cidr_b
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "talent-academy-private-b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_cidr_c
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "talent-academy-private-c"
  }
}

#NAT GATEWAY PUBLIC

#ELASTIC NAT GATEWAY A
resource "aws_eip" "nat_a_eip" {
  #instance = aws_instance.web.id
  vpc      = true
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

#PRIVATE NAT GATEWAY A
resource "aws_nat_gateway" "nat_private_a" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.public_a.id

   tags = {
    Name = "PRIVATE A NAT Gateway"
  }
}


#ELASTIC NAT GATEWAY B
resource "aws_eip" "nat_b_eip" {
  #instance = aws_instance.web.id
  vpc      = true
}

#PUBLIC NAT GATEWAY B
resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b_eip.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "PUBLIC B NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

#PRIVATE NAT GATEWAY B
resource "aws_nat_gateway" "nat_private_b" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.public_b.id

  tags = {
    Name = "PRIVATE B NAT Gateway"
  }
}

#ELASTIC NAT GATEWAY C
resource "aws_eip" "nat_c_eip" {
  #instance = aws_instance.web.id
  vpc      = true
}

#PUBLIC NAT GATEWAY C
resource "aws_nat_gateway" "nat_c" {
  allocation_id = aws_eip.nat_c_eip.id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "PUBLIC C NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

#PRIVATE NAT GATEWAY C
resource "aws_nat_gateway" "nat_private_c" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.public_c.id

  tags = {
    Name = "PRIVATE C NAT Gateway"
  }
}