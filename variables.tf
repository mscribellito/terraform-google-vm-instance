variable "project_id" {
  type        = string
  description = "The ID of the project in which the VM instance belongs."
}

variable "name" {
  type        = string
  description = "A unique name for the VM instance, required by GCE."
}

variable "zone" {
  type        = string
  description = "The zone that the VM instance should be created in. "
}

variable "labels" {
  type        = map(string)
  description = "A map of key/value label pairs to assign to the VM instance."
  default     = null
}

variable "machine_type" {
  type        = string
  description = "The machine type to create."
  default     = "e2-micro"
}

variable "boot_disk_auto_delete" {
  type        = bool
  description = "Whether the disk will be auto-deleted when the VM instance is deleted."
  default     = true
}

variable "boot_disk_mode" {
  type        = string
  description = "The mode in which to attach this disk."
  default     = "READ_WRITE"
}

variable "boot_disk_type" {
  type        = string
  description = "The GCE disk type."
  default     = "pd-standard"
}

variable "boot_disk_size" {
  type        = number
  description = "The size of the image in gigabytes."
  default     = 20
}

variable "boot_disk_image" {
  type        = string
  description = "The image from which to initialize this disk."
}

variable "service_account_email" {
  type        = string
  description = "The service account e-mail address."
}

variable "service_account_scopes" {
  type        = list(string)
  description = "A list of service scopes."
  default     = ["cloud-platform"]
}

variable "tags" {
  type        = list(string)
  description = "A list of network tags to attach to the VM instance."
  default     = []
}

variable "subnetwork" {
  type        = string
  description = "The name or self_link of the subnetwork to attach this VM instance to."
}

variable "public_ip" {
  type        = bool
  description = "Whether an external IP address will be associated with the VM instance."
  default     = false
}

variable "nat_ip" {
  type        = string
  description = "The IP address that will be 1:1 mapped to the VM instance's public network ip."
  default     = null
}

variable "network_tier" {
  type        = string
  description = "The networking tier used for configuring this VM instance."
  default     = "STANDARD"
}

variable "metadata_startup_script" {
  type        = string
  description = "User startup script to run when VM instances spin up."
  default     = null
}