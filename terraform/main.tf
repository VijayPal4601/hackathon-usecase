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

