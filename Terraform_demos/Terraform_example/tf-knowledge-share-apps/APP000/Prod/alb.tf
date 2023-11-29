# ALB - this is a tests
resource "aws_lb" "app_alb" {
  name               = "APP000-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.public_subnet_a.id, data.aws_subnet.public_subnet_b.id]

  tags = merge(
    local.tags,
    { Name = "APP000-alb-prod" }
  )
}

# Listener 
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_443.arn
  }
}

# Target Group
resource "aws_lb_target_group" "tg_443" {
  name     = "tg-443-app000"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = data.aws_vpc.main_vpc.id
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg_443.arn
  target_id        = aws_instance.APP001LAP01.id
  port             = 443
}

