resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "DB security group"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description = "Any"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # to update from app_sg
  }

  tags = {
    Name = "db_sg"
  }
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "APP security group"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description = "Any"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # to update from app_sg
  }

  tags = {
    Name = "app_sg"
  }
}

resource "aws_security_group" "app_lb_sg" {
  name        = "app_lb_sg"
  description = "APP LB security group"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description = "Any"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # to update from app_sg
  }

  tags = {
    Name = "app_sg"
  }
}
