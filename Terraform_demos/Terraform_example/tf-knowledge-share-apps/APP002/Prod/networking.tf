resource "aws_network_interface" "app_network_interface" {
  subnet_id       = data.aws_subnet.subnet_app_A.id
  private_ips     = ["10.0.1.16"]
  security_groups = [aws_security_group.app_security_group.id]
}