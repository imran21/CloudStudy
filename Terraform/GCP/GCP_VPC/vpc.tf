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
resource "google_compute_subnetwork" "subnet" {
       
       for_each = var.subnet
       
       name = each.value["name"]
       ip_cidr_range = each.value["ip_cidr_range"]
       network = "${var.vpc_name}"
       
       #count = length(each.value["range_name"])
       secondary_ip_range {
       for_each = each.value["range_name"]
       range_name = each.key
       ip_cidr_range = each.value
	}
       depends_on = [google_compute_network.vpc]
       region = each.value["region"]
       
}
/*
resource "google_compute_subnetwork" "subnet-1-sec-ip" {
       for_each = var.subnet
       name = each.value["name"]
       ip_cidr_range = each.value["ip_cidr_range"]
       network = "${var.vpc_name}"
       for_each = var.subnet_1_secondary_ip
       secondary_ip_range {
       range_name    = each.value["range_name"]
       ip_cidr_range = each.value["ip_cidr_range"]
  }
}
*/




resource "google_compute_firewall" "allow-pub-ssh" {
  name    = "allow-pub-ssh"
  network = google_compute_network.vpc.name
 
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-pub-ssh"]
}

resource "google_compute_firewall" "allow-icmp" {
   name    = "allow-pub-icmp"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-pub-icmp"]
}

