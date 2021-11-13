variable "region" {
        default = "us-east1"
        }
variable "gcp_project"  {
        default = "appgcpb2b"
        }
variable "credentials"  {
        default = "credentials.json"
        }
variable "vpc_name" {
        default = "demo-vpc-2"
        }


variable "subnet" {
    type = map(object ({
      name = string
      ip_cidr_range = string
      region = string
     }))
     default = {
     "pub_subnet-1" = {
        name = "pub-subnet-1"
        ip_cidr_range = "10.0.0.0/28"
        region = "us-east1"
        },
      "pub-subnet-2" = {
        name = "pub-subnet-2"
        ip_cidr_range = "10.0.0.16/28"
        region = "us-east1"
        }
        }
        }
