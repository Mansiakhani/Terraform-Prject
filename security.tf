resource "aws_security_group" "allow_ssh" {
  vpc_id      = aws_vpc.my_vpc_1.id
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"
  

  tags = {
    Name = "allow_shterrs"
  }
  ingress {
    
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = -1
  }
}

