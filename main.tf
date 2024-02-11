resource "google_compute_instance" "compute_instance" {

  project = var.project_id

  name         = var.name
  zone         = var.zone
  labels       = var.labels
  machine_type = var.machine_type

  boot_disk {
    auto_delete = var.boot_disk_auto_delete
    mode        = var.boot_disk_mode
    initialize_params {
      size  = var.boot_disk_size
      type  = var.boot_disk_type
      image = var.boot_disk_image
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  tags = var.tags

  network_interface {
    subnetwork = var.subnetwork
    dynamic "access_config" {
      for_each = var.public_ip ? [1] : []
      content {
        nat_ip       = var.nat_ip
        network_tier = var.network_tier
      }
    }
  }

  metadata = {
    startup-script = var.metadata_startup_script
  }

  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }

}