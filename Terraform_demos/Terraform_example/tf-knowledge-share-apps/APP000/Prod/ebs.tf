# APP001LAP01
resource "aws_ebs_volume" "APP001LAP01_vol_01" {
  type              = "gp3"
  size              = "30"
  availability_zone = "us-east-1a"
  encrypted         = true
  kms_key_id        = data.aws_kms_key.kms_key.arn
  tags = {
    "Name" = "APP001LAP01_vol_01"
  }
}

resource "aws_volume_attachment" "APP001LAP01_attachment_01" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.APP001LAP01_vol_01.id
  instance_id = aws_instance.APP001LAP01.id
}

# APP001LAP02
resource "aws_ebs_volume" "APP001LAP02_vol_01" {
  type              = "gp3"
  size              = "30"
  availability_zone = "us-east-1b"
  encrypted         = true
  kms_key_id        = data.aws_kms_key.kms_key.arn
  tags = {
    "Name" = "APP001LAP02_vol_01"
  }
}

resource "aws_volume_attachment" "APP001LAP02_attachment_01" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.APP001LAP02_vol_01.id
  instance_id = aws_instance.APP001LAP02.id
}

# APP001WDP01
resource "aws_ebs_volume" "APP001WDP01_vol_01" {
  type              = "gp2"
  size              = "40"
  availability_zone = "us-east-1a"
  encrypted         = true
  kms_key_id        = data.aws_kms_key.kms_key.arn
  tags = {
    "Name" = "APP001WDP01_vol_01"
  }
}

resource "aws_volume_attachment" "APP001WDP01_attachment_01" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.APP001WDP01_vol_01.id
  instance_id = aws_instance.APP001WDP01.id
}