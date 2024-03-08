# resource "aws_eip" "my_eip" {
#     domain = "vpc"
# }

# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = aws_eip.my_eip.id
#   subnet_id     = aws_subnet.my_public_1.id
  

#   tags = {
#     Name = "NAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.gw]
# }

# resource "aws_route_table" "my_private" {
#   vpc_id = aws_vpc.my_vpc_1.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat_gateway.id
#   }

  
#   tags = {
#     Name = "my_private_route"
#   }
# }

# resource "aws_route_table_association" "my_rt_association_3" {
#     subnet_id=aws_subnet.my_private_1.id
#     route_table_id = aws_route_table.my_private.id
  
# }
# resource "aws_route_table_association" "my_rt_association_4" {
#     subnet_id=aws_subnet.my_private_2.id
#     route_table_id = aws_route_table.my_private.id
  
# }