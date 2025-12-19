resource "aws_instance" "coderco_ec2" {

  instance_type               = "t3.micro"
  ami                         = "ami-068c0051b15cdb816"
  user_data                   = file("${path.module}/user_data/cloud_init.yaml")
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  key_name                    = "deployer_key"

  tags = {
    Name = "coderco-instance"
  }
}
