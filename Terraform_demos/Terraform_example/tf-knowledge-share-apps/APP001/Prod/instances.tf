resource "aws_instance" "db_instance" {
  ami               = "ami-026b57f3c383c2eec"
  instance_type     = "t2.large"
  availability_zone = "us-east-1a"

  network_interface {
    network_interface_id = aws_network_interface.network_interface_1.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 20
  }

  key_name = "hands-on"

  tags = {
    Name = "APP001-WDP01"
  }
}

resource "aws_instance" "app_instance_1" {
  ami               = "ami-026b57f3c383c2eec"
  instance_type     = "t2.small"
  availability_zone = "us-east-1a"

  network_interface {
    network_interface_id = aws_network_interface.network_interface_2.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 10
  }

  key_name = "hands-on"

  tags = {
    Name = "APP001-WAP01"
  }
}

resource "aws_instance" "app_instance_2" {
  ami               = "ami-026b57f3c383c2eec"
  instance_type     = "t2.small"
  availability_zone = "us-east-1a"

  network_interface {
    network_interface_id = aws_network_interface.network_interface_3.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 10
  }

  key_name = "hands-on"

  tags = {
    Name = "APP001-WAP02"
  }
}
