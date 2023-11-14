# create your aws provider
provider "aws" {
  region  = var.region
  profile = "Gali"
}
# create vpc
module "VPC"{
  source                         ="./Modules/VPC"
  region                         = var.region 
  project_name                   = var.project_name
  vpc_cidr                       = var.vpc_cidr
  public_subnet_az1_cidr         = var.public_subnet_az1_cidr
  public_subnet_az2_cidr         = va.ublic_subnet_az2_cidr
  private_app_subnet_az1_cidr    = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr    = var.private_app_subnet_az2_cidr
  private_data_subnet_azl_cidr   = var.private_data_subnet_azl_cidr
  private_data_subnet_az2_cidr   = var.private_data_subnet_az2_cidr



}
