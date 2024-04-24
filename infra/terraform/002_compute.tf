variable "container_image" {
  type    = string
  default = "asia-southeast1-docker.pkg.dev/onyx-logic-420708/demo-docker-registry-id/backend:46e8b27"
}

resource "google_compute_instance" "instance" {
  boot_disk {
    auto_delete = true
    device_name = "instance"

    initialize_params {
      image = "projects/cos-cloud/global/images/cos-stable-109-17800-147-60"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    container-vm = format("cos-stable-%s", "backend")
    goog-ec-src  = "vm_add-tf"
  }

  machine_type = "e2-medium"

  metadata = {
    gce-container-declaration = <<EOF
    spec:
      containers:
      - name: instance
        image: ${var.container_image}
        args: []
        ports:
        - containerPort: 8080
          hostPort: 8080
        securityContext:
        privileged: false  # Set to false for improved security
        stdin: true
        tty: true
      restartPolicy: Always
EOF
  }

  name = "instance"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/onyx-logic-420708/regions/asia-southeast1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "349447787790-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server", "lb-health-check"]
  zone = "asia-southeast1-a"
}
