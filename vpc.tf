resource "aws_vpc" "main" {
      cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet1" {
       vpc_id = aws_vpc.main.id
       cidr_block = var.subnet1_cidr
       map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
       vpc_id = aws_vpc.main.id
       cidr_block = var.subnet2_cidr
       map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
       vpc_id = aws_vpc.main.id
}

resource "aws_route_table" main {
       vpc_id = aws_vpc.main.id
}
resource "aws_route_table_association" "main_1" {
       subnet_id = aws_subnet.subnet1.id
       route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "main_2" {
       subnet_id = aws_subnet.subnet2.id
       route_table_id = aws_route_table.main.id
}
