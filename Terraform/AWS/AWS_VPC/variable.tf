variable "aws_region" {
  default = "us-east-1"
}
variable "aws_access_key" {
  default = ""
}
variable "aws_secret_key" {
  default  = ""
}

variable "vpc_name" {
      default = "oml-demo-vpc"
}
variable "vpc_tenancy" {
      default = "default"
}
variable "vpc_cidr" {
      default = "10.0.0.0/16"
}



variable "subnet" {
    type = map(object ({
      name = string
      ip_cidr_range = string
      az = string
     }))

    default = {
     "pub_subnet-1" = {
        name = "pub-subnet-1"
        ip_cidr_range = "10.0.1.64/26"
        az = "us-east-1a"
        },
     "pub_subnet-2" = {
        name = "pub-subnet-2"
        ip_cidr_range = "10.0.2.64/26"
        az = "us-east-1b"
        },
     "pvt_subnet-1" = {
        name = "pvt-subnet-1"
        ip_cidr_range = "10.0.3.64/26"
        az = "us-east-1c"
        },
     "pvt_subnet-2" = {
        name = "pvt-subnet-2"
        ip_cidr_range = "10.0.4.64/26"
        az = "us-east-1d"
        }
    }
  }



        
     


