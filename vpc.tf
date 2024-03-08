resource "aws_vpc" "my_vpc_1" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames="true"
  tags = {
    Name = "my_vpc_1"
  }
}
resource "aws_subnet" "my_public_1" {
  vpc_id     = aws_vpc.my_vpc_1.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "my_public_1"
  }
}

resource "aws_subnet" "my_public_2" {
  vpc_id     = aws_vpc.my_vpc_1.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "my_public_2"
  }
}

resource "aws_subnet" "my_private_1" {
  vpc_id     = aws_vpc.my_vpc_1.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "my_private_1"
  }
}

resource "aws_subnet" "my_private_2" {
  vpc_id     = aws_vpc.my_vpc_1.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "my_private_2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc_1.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  
  tags = {
    Name = "my_rt"
  }
}
resource "aws_route_table_association" "my_rt_association_1" {
    subnet_id=aws_subnet.my_public_1.id
    route_table_id = aws_route_table.my_rt.id
  
}
resource "aws_route_table_association" "my_rt_association_2" {
    subnet_id=aws_subnet.my_public_2.id
    route_table_id = aws_route_table.my_rt.id
  
}