
resource "aws_instance" "server1"{
  ami           = var.AMIS
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_public_1.id
  key_name      = "EC2 Tutorial"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  
}
