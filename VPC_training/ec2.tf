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
    cidr_blocks      = ["77.99.152.53/32"]
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
    most_recent = true
    filter {
        name = "name"
        values = [ "amzn2-ami-kernel-*" ]
    }
}


# EC2 FOR PRIVATE INSTANCE
resource "aws_instance" "my_first_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
}




# ssh-keygen -t rsa -b 2048

# EC2 FOR PUBLIC INSTANCE
resource "aws_instance" "my_public_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.public_a.id
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
}

# AMI ID
# INSTANCE TYPE
# KEYPAIR
# SUBNET - PRIVATE
# security group
# USER-DATA template (Optional)

# TASK 
# New ec2 in public subnet
# Check the public IP address exisit or add the EIP to the server
# SSH using the keypair to the new public server
# Try to copy the your private key to the public server and connect to the private server


# resource "aws_instance" "my_ec2_instance" {
#     ami = data.aws_ami.my_aws_ami.id
# }