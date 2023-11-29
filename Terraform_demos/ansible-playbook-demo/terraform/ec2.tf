resource "aws_security_group" "my_app_sg" {
    name = "my_app_sg"
    description = "Allow access to my Server"
    vpc_id = module.network.my_vpc_id

    # INBOUND RULES
    ingress {
        description = "local SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
    }

    ingress {
        description = "HTTP from macbook"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow access to the world"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_block = ["0.0.0.0/0"]
    }

    tag = {
        name = "my_app_sg"
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

resource "aws_instance" "my_public_server" {
    ami = data.aws.ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = module.network.public_subnet_a_id
    vpc_security_group_ids = [aws_security_group.my_app_sg]

    tags = {
        name = "Nginx-Server"
    }
}

resource "local_file" "server_ip" {
    content = aws_instance.my_public_server.public_ip
    filename = "../ansible/host.txt"
}

data "http" "myip" {
    url = "http://ipv4.icanhazip.com"
}