resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-east-1a"
  size              = 10

  tags = {
    Name = "db_volume"
  }
}

resource "aws_volume_attachment" "db_attachment" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.db_ebs.id
  instance_id = aws_instance.db_instance.id
}
