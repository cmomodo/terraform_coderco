module "compute" {
  source                 = "./modules/compute"
  instance_type          = var.instance_type
  ami                    = var.ami
  user_data              = file("${path.module}/user_data/cloud_init.yaml")
  subnet_id              = module.network.subnet_id
  vpc_security_group_ids = [module.network.ec2_security_group_id]
  key_name               = var.key_name
  project_name           = var.project_name
}
