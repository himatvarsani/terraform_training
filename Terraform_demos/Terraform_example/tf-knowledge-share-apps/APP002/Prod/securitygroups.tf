
resource "aws_security_group" "app_security_group" {
  name        = "app002-prod-use1-app"
  description = "App security for APP002"
  vpc_id      = data.aws_vpc.mainVPC.id

  ingress {
    description = "Ingress traffic from ALB"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Department = "IT",
    Name       = "sg-app002-prod-use1-app",
    AppID      = "APP002",
    Env        = "Prod"
  }


}

resource "aws_security_group" "db_security_group" {
  name        = "app002-prod-use1-db"
  description = "Database security for APP002"
  vpc_id      = data.aws_vpc.mainVPC.id

  ingress {
    description = "Ingress traffic from ALB"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Department = "IT",
    Name       = "sg-app002-prod-use1-db",
    AppID      = "APP002",
    Env        = "Prod"
  }
}

resource "aws_security_group" "lb_security_group" {
  name        = "app002-prod-use1-alb"
  description = "LoadBalancer security for APP002"
  vpc_id      = data.aws_vpc.mainVPC.id

  ingress {
    description = "Ingress traffic from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Department = "IT",
    Name       = "app002-prod-use1-alb",
    AppID      = "APP002",
    Env        = "Prod"
  }
}