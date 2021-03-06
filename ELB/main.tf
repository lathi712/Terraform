resource "google_compute_global_forwarding_rule" "default" {
  name       = "global-rule-${local.name_suffix}"
  target     = google_compute_target_http_proxy.default.id
  port_range = "80"
}

resource "google_compute_target_http_proxy" "default" {
  name        = "target-proxy-${local.name_suffix}"
  description = "a description"
  url_map     = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name            = "url-map-target-proxy-${local.name_suffix}"
  description     = "a description"
  default_service = google_compute_backend_service.default.id

  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.default.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.default.id
    }
  }
}

resource "google_compute_backend_service" "default" {
  name        = "backend-${local.name_suffix}"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

  backend {
    group                 = google_compute_region_instance_group_manager.rigm.instance_group
    balancing_mode        = "RATE"
    capacity_scaler       = 0.4
    max_rate_per_instance = 50
  }
  health_checks = [google_compute_http_health_check.default.id]
}

resource "google_compute_http_health_check" "default" {
  name               = "check-backend-${local.name_suffix}"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}


data "google_compute_image" "debian_image" {
  provider = google-beta
  family   = "debian-9"
  project  = "debian-cloud"
}

resource "google_compute_region_instance_group_manager" "rigm" {
  provider = google-beta
  region   = "us-central1"
  name     = "rigm-internal"
  version {
    instance_template = google_compute_instance_template.instance_template.self_link
    name              = "primary"
  }
  base_instance_name = "external-glb"
  target_size        = 1
}

resource "google_compute_instance_template" "instance_template" {
  provider     = google-beta
  region   = "us-central1"
  name         = "template-website-backend-${local.name_suffix}"
  machine_type = "n1-standard-1"

  network_interface {
    network = "default"
  }

  disk {
    source_image = data.google_compute_image.debian_image.self_link
    auto_delete  = true
    boot         = true
  }

  tags = ["allow-ssh", "load-balanced-backend"]
}