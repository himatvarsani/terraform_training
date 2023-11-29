# APP001LAP01 
resource "aws_network_interface" "app_network_interface" {
  subnet_id   = data.aws_subnet.app_subnet.id
  private_ips = ["10.0.1.20"]
  security_groups = [
    data.aws_security_group.global_sg.id,
    aws_security_group.app_sg.id
  ]

  tags = merge(local.tags, { Name = "app000-nic01" })
}

# APP001LAP02
resource "aws_network_interface" "app_network_interface_02" {
  subnet_id   = data.aws_subnet.app_subnet_b.id
  private_ips = ["10.0.2.30"]
  security_groups = [
    data.aws_security_group.global_sg.id,
    aws_security_group.app_sg.id
  ]

  tags = merge(local.tags, { Name = "app000-nic02" })
}

# APP001WDP01
resource "aws_network_interface" "db_network_interface" {
  subnet_id   = data.aws_subnet.db_subnet_a.id
  private_ips = ["10.0.3.40"]
  security_groups = [
    data.aws_security_group.global_sg.id,
    aws_security_group.db_sg.id
  ]

  tags = merge(local.tags, { Name = "app000-nic03" })
}