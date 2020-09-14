resource "google_container_cluster" "primary" {
  name               = var.name
  location           = var.location
  network            = var.network
  subnetwork         = var.subnetwork
  node_locations     = var.node_locations
  default_max_pods_per_node = var.default_max_pods_per_node
  min_master_version = var.master_version
  node_version = var.node_version
  
  resource_labels = {
      cloud    = var.labels["cloud"]
      cluster  = var.labels["cluster"]
      region   = var.labels["region"]
  }
  network_policy {
      enabled = true
  }
   addons_config {
        cloudrun_config {
            disabled = true
        }

        horizontal_pod_autoscaling {
            disabled = true
        }

        http_load_balancing {
            disabled = true
        }

        network_policy_config {
            disabled = true
        }
    }
  cluster_autoscaling {
        enabled = true

        resource_limits {
            maximum       = 2
            minimum       = 1
            resource_type = "memory"
        }
        resource_limits {
            maximum       = 2
            minimum       = 1
            resource_type = "cpu"
        }
    }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_pool {
    initial_node_count = var.initial_node_count
    node_config {
        oauth_scopes = var.oauth_scopes
        machine_type = var.machine_type
        image_type   = var.image_type
        disk_type    = var.disk_type
        disk_size_gb = var.disk_size_gb

        metadata = {
        disable-legacy-endpoints = "true"
        }

        labels = {
            cloud    = var.labels["cloud"]
            cluster  = var.labels["cluster"]
            region   = var.labels["region"]
        }

        tags = var.tags
    }
    autoscaling {
        max_node_count = var.max_node_count
        min_node_count = var.min_node_count
    }

    }

}


