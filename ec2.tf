resource "aws_instance" "coderco_vpc" {

  instance_type = "t3.micro"
  ami           = "ami-068c0051b15cdb816"
  user_data     = file("${path.module}/user_data/cloud_init.yaml")
  # key_name      = "deployer-key"

  tags = {
    Name = "coderco-instance"
  }
}




resource "aws_security_group" "main" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.coderco_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = aws_vpc.coderco_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
