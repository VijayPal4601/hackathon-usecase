output "registry_url" {
  description = "Artifact Registry URL"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repo_name}"
}

output "gke_cluster_name" {
  value = google_container_cluster.gke.name
}

output "gke_zone" {
  value = var.zone
}
