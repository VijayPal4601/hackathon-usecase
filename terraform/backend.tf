terraform {
  backend "gcs" {
    bucket  = "my-tf-state-bucket-4601"
    prefix  = "artifact-registry"
  }
}
