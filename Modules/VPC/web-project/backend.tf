#store the terraform files in s3
terraform {
  backend "s3" {
bucket = "myvpcmodule"
key = "Web-project.tfstate"
region = "us-east-1"
profile = "Gali "

  }
}