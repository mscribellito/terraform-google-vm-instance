variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "name" {
  type        = string
  description = "A unique name for the resource, required by GCE"
}

variable "labels" {
  type        = map(string)
  description = "A map of key/value label pairs to assign to the instance"
  default     = {}
}

variable "region" {
  type        = string
  description = "Region where the instance should be created"
}

variable "zone" {
  type        = string
  description = "The zone that the machine should be created in"
  default     = null
}

variable "machine_type" {
  type        = string
  description = "The machine type to create"
  default     = "e2-micro"
}

variable "boot_disk" {
  type = object({
    image       = string
    type        = optional(string, "pd-standard")
    size        = optional(number, 10)
    auto_delete = optional(bool, false)
  })
  description = "The boot disk for the instance"
}

variable "service_account" {
  type = object({
    email  = optional(string, null)
    scopes = optional(list(string), ["cloud-platform"])
  })
  description = "Service account to attach to the instance"
  default = {
    email  = null
    scopes = null
  }
}

variable "network_tags" {
  type        = list(string)
  description = "A list of network tags to attach to the instance"
  default     = null
}

variable "hostname" {
  type        = string
  description = "A custom hostname for the instance"
  default     = null
}

variable "can_ip_forward" {
  type        = bool
  description = "Whether to allow sending and receiving of packets with non-matching source or destination IPs"
  default     = false
}

variable "network_interfaces" {
  type = list(object({
    subnetwork = string
    network_ip = optional(string, null)
    access_config = optional(object({
      nat_ip       = optional(string, null)
      network_tier = optional(string, "PREMIUM")
    }), null)
  }))
  description = "Networks to attach to the instance"
}

variable "attached_disks" {
  type = list(object({
    source      = string
    mode        = optional(string, "READ_WRITE")
    device_name = optional(string, null)
  }))
  description = "Additional disks to attach to the instance"
  default     = []
}

variable "shielded_instance_config" {
  type = object({
    enable_secure_boot          = optional(bool, false)
    enable_vtpm                 = optional(bool, true)
    enable_integrity_monitoring = optional(bool, true)
  })
  description = "Enable Shielded VM on this instance"
  default = {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}

variable "deletion_protection" {
  type        = bool
  description = "Enable deletion protection on this instance"
  default     = true
}

variable "metadata" {
  type        = map(string)
  description = "Metadata key/value pairs to make available from within the instance"
  default     = {}
}

variable "resource_policies" {
  type        = list(string)
  description = "A list of self_links of resource policies to attach to the instance"
  default     = []
}

variable "allow_stopping_for_update" {
  type        = bool
  description = "If true, allows Terraform to stop the instance to update its properties"
  default     = false
}

variable "snapshot_schedule" {
  type        = string
  description = "The snapshot schedule to attach to the instance boot disk"
  default     = null
}
