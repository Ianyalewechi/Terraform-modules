output "region" {
    value = var.region
}
output "Project_name" {
    value = var.Project_name
}

output "vpc_id" {
    value = var.aws_vpc.vpc.id
}


output "Public_subnet_azl_id" {
    value = aws_subnet.Public_subnet_azl.id
}

output "Public_subnet_az2_id" {
    value = aws_subnet.Public_subnet_az2.id
}

output "private_app_subnet_azl.id" {
    value = aws_subnet.private_app_subnet_azl.id
}

output "private_app_subnet_az2.id" {
    value = aws_subnet.private_app_subnet_az2
}

output "private_data_subnet_az1.id" {
    value =  aws_subnet.private_data_subnet_azl.id
}

output "private_data_subnet_az2.id" {
    value =  aws_subnet.private_data_subnet_az2.id
}

output "internet_gateway" {
    value = aws_internet_gateway.internet_gateway
}