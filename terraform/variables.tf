variable "project_id" {}
variable "region" {
  default = "us-central1"
}
variable "repo_name" {
  default = "hackathon-repo"
}

variable "zone" {
  default = "us-central1-a"
}

variable "gke_cluster_name" {
  default = "hackathon-gke"
}
