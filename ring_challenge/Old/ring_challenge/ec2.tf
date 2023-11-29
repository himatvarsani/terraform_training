resource "aws_security_group" "my_app_sg" {
  name        = "my_app_sg"
  description = "Allow access to my Server"
  vpc_id      = aws_vpc.main_vpc.id

    # INBOUND RULES
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  }

#Karolina
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["31.205.63.101/32"]
  }

#Ashley
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["86.21.150.205/32"]
  }

#Tahsin
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["81.108.153.97/32"]
  }

#Himat
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["77.99.152.53/32"]
  }

  #Mia
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["72.74.153.243/32"]
  }

  #PASCAL
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["92.239.22.191/32"]
  }

  egress {
      description = "Allow access to the world"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_app_sg"
  }
}


data "aws_ami" "my_aws_ami" {
    owners = ["137112412989"]
    filter {
        name = "name"
        values = ["amzn2-ami-kernel-*"]
    }
    most_recent = true
}
data "template_file" "ec2_user_data_master" {
  template = "${file("${path.cwd}/bootstrap-master.sh.tpl")}"
  vars = {
    private_key = data.local_file.private_key.content
  }
}
data "template_file" "ec2_user_data_private" {
  template = "${file("${path.cwd}/private_servers.sh.tpl")}"
  vars = {
    private_key = data.local_file.private_key.content
  }
}
data "template_file" "ec2_user_data" {
  template = "${file("${path.cwd}/bootstrap.sh.tpl")}"
  vars = {
    private1_ip = aws_instance.private_1.private_ip
    private2_ip = aws_instance.private_2.private_ip
    private3_ip = aws_instance.private_3.private_ip
    private4_ip = aws_instance.private_4.private_ip
    private5_ip = aws_instance.private_5.private_ip
    private_key = data.local_file.private_key.content
  }
  
}

resource "aws_instance" "private_1" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    user_data = "${data.template_file.ec2_user_data_master.rendered}"
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]

    tags = {
        name = "Ring_Instance_1"
    }
}
resource "aws_instance" "private_2" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    user_data = "${data.template_file.ec2_user_data_private.rendered}"
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
    tags = {
        name = "Ring_Instance_2"
    }
}
resource "aws_instance" "private_3" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    user_data = "${data.template_file.ec2_user_data_private.rendered}"
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
    tags = {
        name = "Ring_Instance_3"
    }
}
resource "aws_instance" "private_4" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    user_data = "${data.template_file.ec2_user_data_private.rendered}"
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]

    tags = {
        name = "Ring_Instance_4"
    }
}
resource "aws_instance" "private_5" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    user_data = "${data.template_file.ec2_user_data_private.rendered}"
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
    
    tags = {
        name = "Ring_Instance_5"
    }
}


resource "aws_instance" "my_public_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.public_a.id
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
    user_data = "${data.template_file.ec2_user_data.rendered}"
}