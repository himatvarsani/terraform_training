# ROUTE TABLE, ROUTE TABLE ASSOCIATIONS
resource "aws_route_table" "public_to_internet" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
      Name = "igw-route-table"
  }
}

resource "aws_route_table" "private_to_public" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
        Name = "private-to-public-rt"
    }
}

resource "aws_route_table_association" "igw_for_public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_to_internet.id
}

resource "aws_route_table_association" "private_to_public_rt" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private_to_public.id
}