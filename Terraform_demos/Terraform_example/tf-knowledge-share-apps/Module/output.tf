output "app_instance_id" {
  value = aws_instance.app_instance.id
}

output "app_instance_2_id" {
  value = aws_instance.app_instance_2.id
}

output "db_instance_id" {
  value = aws_instance.db_instance.id
}

output "alb_arn" {
  value = aws_lb.app_alb.arn
}
