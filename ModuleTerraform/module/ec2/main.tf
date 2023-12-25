provider "aws" {
  region = var.region
}

variable "region" {}
variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/Desktop.pub")
  }
  

resource "aws_instance" "example" {
  key_name      = aws_key_pair.deployer.id
  count         = length(var.availability_zones)
  ami           = "ami-0905a3c97561e0b69"  # Use the desired Ubuntu AMI
  instance_type = "t2.micro"

  subnet_id = element(aws_subnet.example[*].id, count.index)

  user_data = file("../../scripts/userdata.sh")

  tags = {
    Name = "${var.environment}-instance-${count.index + 1}"
  }
}
variable environment{
  default  = "dev"
  }
resource "aws_subnet" "example" {
  count = length(var.availability_zones)

  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.${count.index + 1}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet-${count.index + 1}"
  }
}
