data "google_compute_zones" "available" {
  project = var.project_id

  region = var.region
}

resource "google_compute_disk_resource_policy_attachment" "attachment" {
  count = var.snapshot_schedule != null ? 1 : 0

  project = var.project_id

  disk = var.name
  name = var.snapshot_schedule
  zone = google_compute_instance.default.zone
}

resource "google_compute_instance" "default" {
  project = var.project_id

  name         = var.name
  labels       = var.labels
  zone         = var.zone == null ? data.google_compute_zones.available.names[0] : var.zone
  machine_type = var.machine_type

  boot_disk {
    auto_delete = var.boot_disk.auto_delete
    initialize_params {
      type  = var.boot_disk.type
      size  = var.boot_disk.size
      image = var.image
    }
  }

  service_account {
    email  = var.service_account.email
    scopes = var.service_account.scopes
  }

  tags           = var.network_tags
  hostname       = var.hostname
  can_ip_forward = var.can_ip_forward

  network_interface {
    subnetwork = var.network_interface.subnetwork
    dynamic "access_config" {
      for_each = var.network_interface.access_config != null ? [1] : []
      content {
        nat_ip       = var.network_interface.access_config.nat_ip
        network_tier = var.network_interface.access_config.network_tier
      }
    }
  }

  shielded_instance_config {
    enable_secure_boot          = var.shielded_instance_config.enable_secure_boot
    enable_vtpm                 = var.shielded_instance_config.enable_vtpm
    enable_integrity_monitoring = var.shielded_instance_config.enable_integrity_monitoring
  }

  deletion_protection = var.deletion_protection

  metadata = {
    startup-script = var.startup_script
  }

  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }
}
