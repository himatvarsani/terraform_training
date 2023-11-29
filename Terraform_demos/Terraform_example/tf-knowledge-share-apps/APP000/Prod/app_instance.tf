# APP Instances
resource "aws_instance" "APP001LAP01" {
  ami               = "ami-026b57f3c383c2eec"
  instance_type     = "t2.medium"
  availability_zone = "us-east-1a"
  key_name          = "hands-on"

  lifecycle {
    ignore_changes = [volume_tags]
  }

  network_interface {
    network_interface_id = aws_network_interface.app_network_interface.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.kms_key.arn
  }

  volume_tags = merge(
    local.tags,
    {
      Name = "APP001LAP01-root-vol"
    }
  )

  tags = merge(
    local.tags,
    {
      Name = "APP001LAP01"
    }
  )
}

resource "aws_instance" "APP001LAP02" {
  ami               = "ami-026b57f3c383c2eec"
  instance_type     = "t2.medium"
  availability_zone = "us-east-1b"
  key_name          = "hands-on"

  lifecycle {
    ignore_changes = [volume_tags]
  }

  network_interface {
    network_interface_id = aws_network_interface.app_network_interface_02.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.kms_key.arn
  }

  volume_tags = merge(
    local.tags,
    {
      Name = "APP001LAP02-root-vol"
    }
  )

  tags = merge(
    local.tags,
    {
      Name = "APP001LAP02"
    }
  )

}
