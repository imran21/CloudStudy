provider "google" {
 credentials = file("${var.credentials}")
 project     = var.gcp_project
 region      = var.region
}

resource "google_compute_network" "vpc" {
 name                    = "${var.vpc_name}"
 auto_create_subnetworks = "false"
 routing_mode = "GLOBAL"
}

#resource "google_compute_subnetwork" "pub_subnet" {
# name          = "${var.pub_subnet_name}"
# ip_cidr_range = var.pub_subnet_cidr
# network       = "${var.vpc_name}"
# depends_on    = [google_compute_network.vpc]
# region      = var.region
#}

resource "google_compute_subnetwork" "subnet" {
       for_each = var.subnet
       name = each.value["name"]
       ip_cidr_range = each.value["ip_cidr_range"]
       network = "${var.vpc_name}"
       depends_on = [google_compute_network.vpc]
       region = each.value["region"]
}
