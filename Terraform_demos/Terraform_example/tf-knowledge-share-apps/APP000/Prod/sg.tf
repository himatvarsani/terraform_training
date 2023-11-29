# ALB SG
resource "aws_security_group" "alb_sg" {
  name        = "app000-prod-use1-alb"
  description = "ALB traffic"
  vpc_id      = data.aws_vpc.main_vpc.id

  #Ingress
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(local.tags, { Name = "sg-app000-prod-use1-alb" })
}

# APP SG
resource "aws_security_group" "app_sg" {
  name        = "app000-prod-use1-app"
  description = "Application traffic"
  vpc_id      = data.aws_vpc.main_vpc.id

  #Ingress
  ingress {
    description     = "HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  ingress {
    description     = "3690"
    from_port       = 3690
    to_port         = 3690
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  tags = merge(local.tags, { Name = "sg-app000-prod-use1-app" })
}

# DB SG
resource "aws_security_group" "db_sg" {
  name        = "app000-prod-use1-db"
  description = "Database traffic"
  vpc_id      = data.aws_vpc.main_vpc.id

  #Ingress
  ingress {
    description     = "HTTP"
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }
  tags = merge(local.tags, { Name = "sg-app000-prod-use1-db" })
}

