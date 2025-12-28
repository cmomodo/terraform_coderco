# Create a VPC
resource "aws_vpc" "coderco_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

#the main subnet.
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.coderco_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.project_name}-subnet"
  }
}
#attaching vpc to internet gateway
resource "aws_internet_gateway" "coderco_igw" {
  vpc_id = aws_vpc.coderco_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

#route table for internet gateway
resource "aws_route_table" "coderco_route" {
  vpc_id = aws_vpc.coderco_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.coderco_igw.id
  }



  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

#route table association with subnet.check
resource "aws_route_table_association" "coderco_route_table_association" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.coderco_route.id
}

resource "aws_security_group" "main" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.coderco_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

#security group for ec2
resource "aws_security_group" "ec2" {
  name        = "allow_ec2"
  description = "Allow inbound traffic from ec2"
  vpc_id      = aws_vpc.coderco_vpc.id

  tags = {
    Name = "${var.project_name}_ec2_traffic"
  }
  #port 80 for http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #port 22 for ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allow_ssh_cidr]
  }
  #outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = aws_vpc.coderco_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443


}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80


}