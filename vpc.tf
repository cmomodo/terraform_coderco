# Create a VPC
resource "aws_vpc" "coderco_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.coderco_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "coderco_igw" {
  vpc_id = aws_vpc.coderco_vpc.id

  tags = {
    Name = "CoderCo IGW"
  }
}


resource "aws_route_table" "coderco_route" {
  vpc_id = aws_vpc.coderco_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.coderco_igw.id
  }



  tags = {
    Name = "coderco-public"
  }
}

#route table association with subnet.check
resource "aws_route_table_association" "coderco_route_table_association" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.coderco_route.id
}
