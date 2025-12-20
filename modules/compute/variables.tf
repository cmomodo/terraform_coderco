variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
}

variable "ami" {
  description = "The ami for the ec2 instance"
  type        = string
}

variable "user_data" {
  description = "The user data script to run on instance launch"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with"
  type        = list(string)
}

variable "key_name" {
  description = "The key pair name"
  type        = string
}

variable "project_name" {
  description = "The project name for tagging"
  type        = string
}
