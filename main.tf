terraform {
  required_version = ">= 1.3.0"
}

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
    initialize_params {
      image = var.boot_disk.image
      type  = var.boot_disk.type
      size  = var.boot_disk.size
    }
    auto_delete = var.boot_disk.auto_delete
  }

  service_account {
    email  = var.service_account.email
    scopes = var.service_account.scopes
  }

  tags           = var.network_tags
  hostname       = var.hostname
  can_ip_forward = var.can_ip_forward

  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      subnetwork = network_interface.value.subnetwork
      dynamic "access_config" {
        for_each = network_interface.value.access_config != null ? [1] : []
        content {
          nat_ip       = network_interface.value.access_config.nat_ip
          network_tier = network_interface.value.access_config.network_tier
        }
      }
    }
  }

  dynamic "attached_disk" {
    for_each = var.attached_disks
    content {
      source      = attached_disk.value.source
      mode        = attached_disk.value.mode
      device_name = attached_disk.value.device_name
    }
  }

  shielded_instance_config {
    enable_secure_boot          = var.shielded_instance_config.enable_secure_boot
    enable_vtpm                 = var.shielded_instance_config.enable_vtpm
    enable_integrity_monitoring = var.shielded_instance_config.enable_integrity_monitoring
  }

  deletion_protection = var.deletion_protection

  metadata = var.metadata

  resource_policies = var.resource_policies

  allow_stopping_for_update = var.allow_stopping_for_update

  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }
}
