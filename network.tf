module "network" {
  source            = "./modules/network"
  project_name      = var.project_name
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  allow_ssh_cidr    = var.allow_ssh_cidr
  availability_zone = var.availability_zone
}
