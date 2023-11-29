# ALB
resource "aws_lb" "app_alb" {
  name               = "${var.app_id}-alb-${lower(var.environment)}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.public_subnet_a.id, data.aws_subnet.public_subnet_b.id]

  tags = merge(
    local.tags,
    { Name = "${var.app_id}-alb-${lower(var.environment)}" }
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
  name     = "tg-443-${var.app_id}"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = data.aws_vpc.main_vpc.id
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "app_instance_1" {
  target_group_arn = aws_lb_target_group.tg_443.arn
  target_id        = aws_instance.app_instance.id
  port             = 443
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "app_instance_2" {
  target_group_arn = aws_lb_target_group.tg_443.arn
  target_id        = aws_instance.app_instance_2.id
  port             = 443
}
