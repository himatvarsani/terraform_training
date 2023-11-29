resource "aws_instance" "app_instance" {

  ami               = var.ami
  instance_type     = coalesce(var.app_instance_type, lower(var.environment) == "prod" ? "t2.medium" : "t2.micro")
  availability_zone = "${var.region}${var.az[0]}"
  key_name          = var.key_name

  root_block_device {
    volume_size = coalesce(var.app_ebs_root_size, lower(var.environment) == "prod" ? 30 : 15)
    # if else statement ? => lower = prod -> first value is true, second is false
    volume_type = coalesce(lower(var.environment) == "prod" ? "gp3" : "gp2")
    encrypted   = var.encrypted
    kms_key_id  = coalesce(var.kms_key_id, data.aws_kms_key.kms_key.arn)
  }

  network_interface {
    network_interface_id = aws_network_interface.app_network_interface.id
    device_index         = 0
  }

  lifecycle {
    ignore_changes = [volume_tags]
  }

  volume_tags = merge(
    local.tags,
    {
      Name = "${var.app_id}-LAP01-root-vol"
    }
  )
  tags = merge(
    local.tags,
    {
      Name = "${var.app_id}-LAP01"
    }
  )
}

resource "aws_instance" "app_instance_2" {

  ami               = var.ami
  instance_type     = coalesce(var.app_instance_type, lower(var.environment) == "prod" ? "t2.medium" : "t2.micro")
  availability_zone = "${var.region}${var.az[1]}"
  key_name          = var.key_name

  root_block_device {
    volume_size = coalesce(var.app_ebs_root_size, lower(var.environment) == "prod" ? 20 : 15)
    volume_type = coalesce(lower(var.environment) == "prod" ? "gp3" : "gp2")
    encrypted   = var.encrypted
    kms_key_id  = coalesce(var.kms_key_id, data.aws_kms_key.kms_key.arn)
  }

  network_interface {
    network_interface_id = aws_network_interface.app_network_interface_02.id
    device_index         = 0
  }

  lifecycle {
    ignore_changes = [volume_tags]
  }

  volume_tags = merge(
    local.tags,
    {
      Name = "${var.app_id}-LAP02-root-vol"
    }
  )
  tags = merge(
    local.tags,
    {
      Name = "${var.app_id}-LAP02"
    }
  )
}

resource "aws_instance" "db_instance" {

  ami               = var.ami
  instance_type     = coalesce(var.db_instance_type, lower(var.environment) == "prod" ? "t2.large" : "t2.medium")
  availability_zone = "${var.region}${var.az[2]}"
  key_name          = var.key_name

  root_block_device {
    volume_size = coalesce(var.db_ebs_root_size, lower(var.environment) == "prod" ? 30 : 10)
    volume_type = coalesce(lower(var.environment) == "prod" ? "gp3" : "gp2")
    encrypted   = var.encrypted
    kms_key_id  = coalesce(var.kms_key_id, data.aws_kms_key.kms_key.arn)
  }

  network_interface {
    network_interface_id = aws_network_interface.db_network_interface.id
    device_index         = 0
  }

  lifecycle {
    ignore_changes = [volume_tags]
  }

  volume_tags = merge(
    local.tags,
    {
      Name = "${var.app_id}-WDP01-root-vol"
    }
  )
  tags = merge(
    local.tags,
    {
      Name = "${var.app_id}-WDP01"
    }
  )
}

