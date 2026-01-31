provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "artifactregistry" {
  service = "artifactregistry.googleapis.com"
}

resource "google_artifact_registry_repository" "gcr_repo" {
  location      = var.region
  repository_id = "hackathon-repo"
  format        = "DOCKER"
  depends_on    = [google_project_service.artifactregistry]
}

resource "google_project_service" "gke" {
  service = "container.googleapis.com"
}

resource "google_container_cluster" "gke" {
  name     = var.gke_cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  depends_on = [
    google_project_service.gke
  ]
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.gke.name
  location   = var.zone
  node_count = 2

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
