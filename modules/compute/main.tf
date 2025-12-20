resource "aws_instance" "coderco_ec2" {
  instance_type               = var.instance_type
  ami                         = var.ami
  user_data                   = var.user_data
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name

  tags = {
    Name = "${var.project_name}-instance"
  }
}
