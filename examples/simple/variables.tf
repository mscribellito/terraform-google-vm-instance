variable "project_id" {
  type        = string
  description = "The ID of the project in which the VM instance belongs."
}

variable "name" {
  type        = string
  description = "A unique name for the VM instance, required by GCE."
  default     = "simple"
}

variable "zone" {
  type        = string
  description = "The zone that the VM instance should be created in. "
  default     = "us-east1-b"
}

variable "boot_disk_image" {
  type        = string
  description = "The image from which to initialize this disk."
}

variable "service_account_email" {
  type        = string
  description = "The service account e-mail address."
}

variable "subnetwork" {
  type        = string
  description = "The name or self_link of the subnetwork to attach this VM instance to."
}

variable "public_ip" {
  type        = bool
  description = "Whether an external IP address will be associated with the VM instance."
  default     = true
}