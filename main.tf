module "compute" {
  source                 = "./modules/compute"
  instance_type          = var.instance_type
  ami                    = var.ami
  user_data              = file("${path.module}/user_data/cloud_init.yaml")
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = var.key_name
  project_name           = var.project_name
}

