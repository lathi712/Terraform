variable "name" {
    type = string
    default = "test"
}
variable "network" {
    type = string
    default = "default"
}
variable "subnetwork" {
    type = string
    default = "default"
}
variable "master_ipv4_cidr_block" {
    type = string
    default = ""
}

variable "location" {
    type = string
    default = "us-central1-a"
}
variable "region" {
    type = string
    default = "us-central1"
}
variable "master_version" {
    type = string
    default = "1.15.12-gke.16"
}
variable "node_version" {
    type = string
    default = "1.15.12-gke.16"
}
variable "initial_node_count" {
    type = number
    default = 1
}
variable "default_max_pods_per_node" {
    type = number
    default = 10
}
variable "max_node_count" {
    type = number
    default = 5
}
variable "min_node_count" {
    type = number
    default = 1
}
variable "machine_type" {
    type = string
    default = "n1-standard-1"
}
variable "image_type" {
    type = string
    default = "COS"
}
variable "disk_type" {
    type = string
    default = "pd-standard"
}
variable "disk_size_gb" {
    type = string
    default = "50"
}

variable "labels" {
    type = map
    default = {
        "cloud"   = "gcp"
        "cluster"  = "gke"
        "region"  = "us-central1"
    }
}

variable "project" {
    type = string
    default = "totemic-formula-279901"
}

variable "tags"{
    type = list
    default = ["allow-ping", "allow-public"]
}
variable "node_locations"{
    type = list
    default = ["us-central1-b","us-central1-c"]
}

variable "oauth_scopes"{
    type = list
    default = ["https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring"]
}

