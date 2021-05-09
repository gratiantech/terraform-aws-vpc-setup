variable "region" {
  description = "Region in which the VPC needs to be created"
  default = "us-east-1"
}

variable "environment" {
  description = "Environment Name"
  default = "UDareme"
}

variable "vpc_cidr" {
  description = "CIDR block of the vpc"
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list
  description = "CIDR block for the public subnet"
  default = ["10.0.0.0/27","10.0.0.32/27"]
}

variable "private_subnets_cidr" {
  type        = list
  description = "CIDR block for the private subnet"
  default = ["10.0.1.0/27", "10.0.1.32/27"]
}

variable "availability_zones" {
  type        = list
  description = "AZ in which the resources will be launched"
  default = ["us-east-1a", "us-east-1b"]
}

variable "app_instance_type" {
  default = "t2.micro"
}

variable "ubuntu_owner" {
  default = "099720109477"
}

variable "nat_instance_type" {
  default = "t2.nano"  
}