provider "aws" {
  region = "eu-west-1"  # Change this based on the environment
}

module "vpc" {
  source   = "../module/vpc"
  region   = "eu-west-1"  # Change this based on the environment
  environment = "prod"  # Change this based on the environment
}

module "ec2" {
  source             = "../module/ec2"
  region             = "eu-west-1"  # Change this based on the environment
  environment        = "prod"  # Change this based on the environment
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]  # Add more if needed
}
