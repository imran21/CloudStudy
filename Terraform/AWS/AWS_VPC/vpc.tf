provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_vpc" "main" {
   
  cidr_block = var.vpc_cidr
  instance_tenancy = var.vpc_tenancy


tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
   for_each = var.subnet
  
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value["ip_cidr_range"]
  availability_zone = each.value["az"]

  tags = {
    Name = each.value["name"]
  }
}



