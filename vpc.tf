# Create a VPC
resource "aws_vpc" "coderco_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.coderco_vpc.id
  cidr_block = "10.0.2.0/24"

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
