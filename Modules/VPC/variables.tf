

variable "Private_data_subnet_az2_cidr" {
  description = "CIDR block for private data subnet AZ2"
  type        = string
}

variable "Private_app_subnet_az2_cidr" {
  description = "CIDR block for private app subnet AZ2"
  type        = string
}

# Declare other missing variables similarly
variable "Public_subnet_azl_cidr" {
  description = "CIDR block for public subnet AZ1"
  type        = string
}

variable "Public_subnet_az2_cidr" {
  description = "CIDR block for public subnet AZ2"
  type        = string
}

variable "Private_app_subnet_az1_cidr" {
  description = "CIDR block for private app subnet AZ1"
  type        = string
}

variable "Private_data_subnet_az1_cidr" {
  description = "CIDR block for private data subnet AZ1"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "Project_name" {
  description = "Project name for tagging resources"
  type        = string
}
