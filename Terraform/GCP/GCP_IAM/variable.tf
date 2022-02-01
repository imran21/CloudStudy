variable "region" {
        default = "us-east1"
        }
variable "gcp_project"  {
        default = "appgcpb2b"
        }
variable "service_account" {
  type = map

  default = {
    service-account-id = "demo-service-account"
    service-account-name = "terraform-demo"
  }
}

variable "credentials"  {
        default = "credentials.json"
        }
variable "vpc_name" {
        default = "demo-vpc-2"
        }



