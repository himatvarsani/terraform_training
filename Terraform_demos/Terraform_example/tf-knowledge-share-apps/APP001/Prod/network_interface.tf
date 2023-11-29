resource "aws_network_interface" "network_interface_1" {
  subnet_id       = data.aws_subnet.data_subnet_1.id
  private_ips     = ["10.0.3.10"]
  security_groups = [aws_security_group.db_sg.id]
}

resource "aws_network_interface" "network_interface_2" {
  subnet_id       = data.aws_subnet.data_subnet_1.id
  private_ips     = ["10.0.3.20"]
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_network_interface" "network_interface_3" {
  subnet_id       = data.aws_subnet.data_subnet_1.id
  private_ips     = ["10.0.3.30"]
  security_groups = [aws_security_group.app_sg.id]
}
