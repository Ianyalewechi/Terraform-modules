#create vpc
resource "aws_vpc" "VPC" {
  cidr_block       =var.vpc_cidr 
  instance_tenancy = "default"
  enable_dns_hostnames =true
  tags = {
    Name = "${var.Project_name}-VPC"
  }
}
#create internet gatway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
vpc_id = aws_vpc.vpc.id
tags   = {
Name   ="${var.Project_name}-igw"

  }
}

#use data source to get all avaliability zones in a region
data "aws_availability_zones""availability_zones" {}

#create public subnet azl

resource "aws_subnet" "Public_subnet_azl" {
  vpc_id     = aws_vpc.vpc.id 
  cidr_block = var.Public_subnet_azl_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch= true

  tags = {
    Name = "Public_subnet_az2"
}
}

#create public subnet az2

resource "aws_subnet" "Public_subnet_az2" {
  vpc_id     = aws_vpc.vpc.id 
  cidr_block = var.Public_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch= true

  tags = {
    Name = "Public_subnet_azl"
}
}

#create route table and add a public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id 

  route {
    cidr_block ="0.0.0.0/0" 
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  
tags =  {
  name ="public route table"
}  
}

#associate public subnet az1 to public route table
resource "aws_route_table_association" "Public_subnet_az1_route_table_association" {
subnet_id      = aws_subnet.Public_subnet_azl.id
route_table_id =aws_route_table.public_route_table.id
}
#associate public subnet az2 to public route table
resource "aws_route_table_association" "Public_subnet_az2_route_table_association" {
subnet_id      = aws_subnet.Public_subnet_az2.id
route_table_id =aws_route_table.public_route_table.id
}

#create private app subnet az1

resource "aws_subnet" "private_app_subnet_azl" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.Private_app_subnet_az1_cidr 
  availability_zone =   data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet app az1"
  }
}

#create private app subnet az2

resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.Private_app_subnet_az2_cidr 
  availability_zone =   data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet app az2"
  }
}

#create private data subnet az1

resource "aws_subnet" "private_data_subnet_azl" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.Private_data_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private data subnet az1"
  }
}

#create private data subnet az2

resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.Private_data_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private data subnet az2"
  }
}