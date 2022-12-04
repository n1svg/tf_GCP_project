output "vpc_id" {
    value = google_compute_network.vpc_network
}

output "vpc_public_subnets" {
    value = google_compute_subnetwork.public-subnetwork
}

output "vpc_private_subnets" {
  value = google_compute_subnetwork.private-subnetwork
}