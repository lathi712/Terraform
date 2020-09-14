terraform {
  backend "gcs" {
    bucket  = "terraform_state_sodium"
    prefix  = "elb/state"
  }
}