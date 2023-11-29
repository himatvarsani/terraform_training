

resource "aws_network_interface" "app_network_interface" {
  subnet_id   = data.aws_subnet.app_subnet.id
  private_ips = [var.private_ips[0]]
  security_groups = [
    data.aws_security_group.global_sg.id,
    aws_security_group.app_sg.id
  ]

  tags = merge(
    local.tags,
    { Name = "${var.app_id}-eni-01" }
  )
}

resource "aws_network_interface" "app_network_interface_02" {
  subnet_id   = data.aws_subnet.app_subnet_2.id
  private_ips = [var.private_ips[1]]
  security_groups = [
    data.aws_security_group.global_sg.id,
    aws_security_group.app_sg.id
  ]

  tags = merge(
    local.tags,
    { Name = "${var.app_id}-eni-02" }
  )
}

resource "aws_network_interface" "db_network_interface" {
  subnet_id   = data.aws_subnet.db_subnet.id
  private_ips = [var.private_ips[2]]
  security_groups = [
    data.aws_security_group.global_sg.id,
    aws_security_group.db_sg.id
  ]

  tags = merge(
    local.tags, { Name = "${var.app_id}-eni-03" }
  )
}