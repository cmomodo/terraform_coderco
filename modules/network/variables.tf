#project
variable "project_name" {
  type        = string
  description = "The name of the project"
}

#the vpc cidr block
variable "vpc_cidr_block" {
  type        = string
  description = "The vpc cidr block"
  default     = "10.0.0.0/16"
}

#the subnet cidr block
variable "subnet_cidr_block" {
  type        = string
  description = "The subnet cidr block"
  default     = "10.0.3.0/24"
}

#ssh into instance
variable "allow_ssh_cidr" {
  type        = string
  description = "The CIDR block to allow SSH access from"
  default     = "0.0.0.0/0"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone to use for resources"
}
