resource "aws_instance" "publicInstance" {
  ami = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  subnet_id = var.publicSubnetID
  availability_zone = "ap-south-1a"
  key_name = aws_key_pair.ec2_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.publicInstanceSecurityGroup.id]
  associate_public_ip_address = true
  tags = {
    Name = var.EC2Name
  }
}

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2-key-pair"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "aws_security_group" "publicInstanceSecurityGroup" {
  name = "Public-Instance-SG"
  vpc_id = var.VPCID
  ingress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

