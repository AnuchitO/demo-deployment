resource "google_compute_network" "demo-network" {
  name                    = "demo-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "allow-port-8080" {
  name    = "allow-port-8080"
  network = google_compute_network.demo-network.name
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-port-8080"
  network = "projects/onyx-logic-420708/global/networks/default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  # **Important:** Restrict source_ranges for production environments!
  source_ranges = ["0.0.0.0/0"] # Allow access from anywhere for demonstration only
}
