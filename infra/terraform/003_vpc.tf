resource "google_compute_network" "demo-network" {
  name                    = "demo-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "allow-port-http" {
  name    = "allow-port-http"
  network = google_compute_network.demo-network.name
  allow {
    protocol = "tcp"
    ports    = ["8080", "80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server", "lb-health-check"]
}
