variable "aws_region" {
  description = "AWS region to deploy the EC2 instance."
  type        = string
  default     = "ap-south-1"
}

variable "instance_name" {
  description = "Name tag applied to the EC2 instance."
  type        = string
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair for SSH access."
  type        = string
}

variable "security_group_id" {
  description = "ID of an existing security group to attach to the instance."
  type        = string
}

variable "root_volume_size_gb" {
  description = "Size of the root EBS volume in GB."
  type        = number
  default     = 8
}

variable "tags" {
  description = "Additional tags to apply to the EC2 instance."
  type        = map(string)
  default     = {}
}
