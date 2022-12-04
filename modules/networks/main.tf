/*
dynamic "vpc"
    for_each = var.vpc_cidr [0, 1]
  content {
    vpc_cidr = vpc.value

  } 
*/

resource "google_compute_network" "vpc_network" {
  name = "tf-network-1"
  auto_create_subnetworks = false
  mtu                     = 1460
}

#resource "google_compute_network" "vpc_network" {
#  name = "tf-network-2"
#    auto_create_subnetworks = false
#    mtu                     = 1460
#}

resource "google_compute_subnetwork" "public-subnetwork" {
name = "pub-tf-subnetwork"
ip_cidr_range = var.vpc_cidr[0]
region = var.region
network = google_compute_network.vpc_network.name
}

resource "google_compute_subnetwork" "private-subnetwork" {
name = "priv-tf-subnetwork"
ip_cidr_range = var.vpc_cidr[1]
region = var.region
network = google_compute_network.vpc_network.name
}
