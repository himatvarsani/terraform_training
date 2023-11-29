# EBS
resource "aws_ebs_volume" "ebs_vol_01" {
  type              = var.ebs_type["app_1_ebs"] == null ? lower(var.environment) == "prod" ? "gp3" : "gp2" : var.ebs_type["app_1_ebs"]
  size              = var.ebs_size["app_1_ebs"] == null ? lower(var.environment) == "prod" ? 30 : 10 : var.ebs_size["app_1_ebs"]
  availability_zone = "${var.region}${var.az[0]}"
  encrypted         = true
  kms_key_id        = data.aws_kms_key.kms_key.arn
  tags = {
    "Name" = "${var.app_id}LAP01_ebs_vol_01"
  }
}
resource "aws_volume_attachment" "ebs_vol_01_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_vol_01.id
  instance_id = aws_instance.app_instance.id
}

resource "aws_ebs_volume" "ebs_vol_02" {
  type              = var.ebs_type["app_2_ebs"] == null ? lower(var.environment) == "prod" ? "gp3" : "gp2" : var.ebs_type["app_2_ebs"]
  size              = var.ebs_size["app_2_ebs"] == null ? lower(var.environment) == "prod" ? 30 : 10 : var.ebs_size["app_2_ebs"]
  availability_zone = "${var.region}${var.az[1]}"
  encrypted         = true
  kms_key_id        = data.aws_kms_key.kms_key.arn
  tags = {
    "Name" = "${var.app_id}LAP02_ebs_vol_01"
  }
}
resource "aws_volume_attachment" "ebs_vol_02_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_vol_02.id
  instance_id = aws_instance.app_instance_2.id
}

resource "aws_ebs_volume" "ebs_vol_03" {
  type              = var.ebs_type["db_ebs"] == null ? lower(var.environment) == "prod" ? "gp3" : "gp2" : var.ebs_type["db_ebs"]
  size              = var.ebs_size["db_ebs"] == null ? lower(var.environment) == "prod" ? 30 : 10 : var.ebs_size["db_ebs"]
  availability_zone = "${var.region}${var.az[2]}"
  encrypted         = true
  kms_key_id        = data.aws_kms_key.kms_key.arn
  tags = {
    "Name" = "${var.app_id}WDP02_ebs_vol_01"
  }
}
resource "aws_volume_attachment" "ebs_vol_03_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_vol_03.id
  instance_id = aws_instance.db_instance.id
}