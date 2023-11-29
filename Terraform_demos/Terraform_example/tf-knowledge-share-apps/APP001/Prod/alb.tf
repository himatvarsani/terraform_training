resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app_lb_sg.id]
  subnets            = [data.aws_subnet.data_subnet_1.id, data.aws_subnet.data_subnet_2.id]

  tags = {
    Environment = "hands-on"
  }
}

resource "aws_lb_target_group" "app_lb_tg" {
  name     = "app-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main_vpc.id
}

resource "aws_lb_target_group_attachment" "app_lb_tg_attachment_1" {
  target_group_arn = aws_lb_target_group.app_lb_tg.arn
  target_id        = aws_instance.app_instance_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_lb_tg_attachment_2" {
  target_group_arn = aws_lb_target_group.app_lb_tg.arn
  target_id        = aws_instance.app_instance_2.id
  port             = 80
}

resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb_tg.arn
  }
}
