output "app_instance_id" {
  value = aws_instance.APP001LAP01.id
}

output "db_instance_id" {
  value = aws_instance.APP001WDP01.id
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}

output "alb_arn" {
  value = aws_lb.app_alb.arn
}

output "app_vol_id" {
  value = aws_ebs_volume.APP001LAP01_vol_01.id
}

output "db_vol_id" {
  value = aws_ebs_volume.APP001WDP01_vol_01.id
}
