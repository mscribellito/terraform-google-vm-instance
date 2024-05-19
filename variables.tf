variable "project_id" {
  type        = string
  description = "The GCP project ID."
}

variable "name" {
  type        = string
  description = "A unique name for the resource, required by GCE."
}

variable "labels" {
  type        = map(string)
  description = "A map of key/value label pairs to assign to the instance."
  default     = {}
}

variable "region" {
  type        = string
  description = "Region where the instance should be created."
}

variable "zone" {
  type        = string
  description = "The zone that the machine should be created in."
  default     = null
}

variable "machine_type" {
  type        = string
  description = "The machine type to create."
  default     = "e2-micro"
}

variable "boot_disk" {
  type = object({
    auto_delete = optional(bool, false)
    type        = optional(string, "pd-standard")
    size        = optional(number, 10)
  })
  description = "The boot disk for the instance."
  default = {
    auto_delete = false
    type        = "pd-standard"
    size        = 10
  }
}

variable "image" {
  type        = string
  description = "The image from which to initialize this instance."
}

variable "service_account" {
  type = object({
    email  = optional(string, null)
    scopes = optional(list(string), [])
  })
  description = "Service account to attach to the instance."
  default = {
    email  = null
    scopes = []
  }
}

variable "network_tags" {
  type        = list(string)
  description = "A list of network tags to attach to the instance."
  default     = null
}

variable "hostname" {
  type        = string
  description = "A custom hostname for the instance."
  default     = null
}

variable "can_ip_forward" {
  type        = bool
  description = "Whether to allow sending and receiving of packets with non-matching source or destination IPs."
  default     = false
}

variable "network_interface" {
  type = object({
    subnetwork = string
    network_ip = optional(string, null)
    access_config = optional(object({
      nat_ip       = optional(string, null)
      network_tier = optional(string, "PREMIUM")
    }), null)
  })
  description = "Network to attach to the instance."
}

variable "shielded_instance_config" {
  type = object({
    enable_secure_boot          = optional(bool, false)
    enable_vtpm                 = optional(bool, true)
    enable_integrity_monitoring = optional(bool, true)
  })
  description = "Enable Shielded VM on this instance."
  default = {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}

variable "deletion_protection" {
  type        = bool
  description = "Enable deletion protection on this instance."
  default     = true
}

variable "startup_script" {
  type        = string
  description = "User startup script to run when instances spin up."
  default     = null
}

variable "snapshot_schedule" {
  type        = string
  description = "The snapshot schedule to attach to the instance boot disk."
  default     = null
}

variable "allow_stopping_for_update" {
  type        = bool
  description = "If true, allows Terraform to stop the instance to update its properties."
  default     = false
}
