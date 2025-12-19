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
    Name = "coder_co_web_traffic"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
