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
      range_name = map(string)
      sec_ip_cidr_range = map(string)
     }))
     
     default = {
     "pub_subnet-1" = {
        name = "pub-subnet-1"
        ip_cidr_range = "10.0.1.64/26"
        region = "us-east1"
        #range_name = ["pod", "service"]
        #sec_ip_cidr_range = ["10.0.1.128/25", "10.0.2.0/24"]
        range_name = {
           "pod" = "10.0.1.128/25"
           "service" = "10.0.2.0/24"
        }
        },
      "pub-subnet-2" = {
        name = "pub-subnet-2"
        ip_cidr_range = "10.0.5.64/26"
        region = "us-east1"
        #range_name = ["pod", "service"]
        #sec_ip_cidr_range = ["10.0.5.128/25", "10.0.6.0/24"]
        range_name = {
           "pod" = "10.0.5.128/25"
           "service" = "10.0.6.0/24"
        }


        }
        }
        }
variable "subnet_1_secondary_ip" {
      type = map(object ({
        range_name = string
        ip_cidr_range = string
      }))
      default = {
      "pod_ip" = {
         range_name = "subnet-1-secondary-ip-pod"
         ip_cidr_range = "10.0.1.128/25"
       },
       "service_ip" = {
         range_name = "subnet-1-secondary-ip-services"
         ip_cidr_range = "10.0.2.0/24"
       }
       }
       }

