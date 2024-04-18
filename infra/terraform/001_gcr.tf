resource "google_artifact_registry_repository" "docker-registry" {
  location      = "asia-southeast1"
  description   = "Demo Docker registry"
  format        = "DOCKER"
  repository_id = "demo-docker-registry-id"
}
