#project
variable "project_name" {
  type        = string
  description = "The name of the project"

}

#the aws region to use for the resources
variable "region" {
  type        = string
  description = "The AWS region to use for the resources"
  default     = "us-east-1"
}

#The instance type to use for the EC2 instance
variable "instance_type" {
  type        = string
  description = "The instance type to use for the EC2 instance"
 
}

#The ami for the ec2 instance
variable "ami" {
  type        = string
  description = "The ami for the ec2 instance"
  
}

#The keypair
variable "key_name" {
  type        = string
  description = "The keypair to use for the ec2 instance"
  
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
