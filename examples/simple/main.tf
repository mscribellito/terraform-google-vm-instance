provider "google" {
  project = var.project_id
}

module "vm" {
  source = "github.com/mscribellito/terraform-google-vm-instance"

  project_id            = var.project_id
  name                  = var.name
  zone                  = var.zone
  boot_disk_image       = var.boot_disk_image
  service_account_email = var.service_account_email
  subnetwork            = var.subnetwork
  public_ip             = true
}