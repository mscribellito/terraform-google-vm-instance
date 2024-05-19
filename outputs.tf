output "name" {
  description = "The name of the created resource"
  value       = google_compute_instance.default.name
}

output "instance_id" {
  description = "The server-assigned unique identifier of this instance"
  value       = google_compute_instance.default.instance_id
}

output "id" {
  description = "The identifier of the created resource"
  value       = google_compute_instance.default.id
}

output "self_link" {
  description = "The URI of the created resource"
  value       = google_compute_instance.default.self_link
}

output "status" {
  description = "The current status of the instance"
  value       = google_compute_instance.default.current_status
}

output "zone" {
  description = "The zone of the instance"
  value       = google_compute_instance.default.zone
}

output "labels" {
  description = "The labels of the instance"
  value       = google_compute_instance.default.labels
}

output "image" {
  description = "Image self link that was used to create the instance"
  value       = google_compute_instance.default.boot_disk.0.initialize_params.0.image
}

output "internal_ip" {
  description = "The internal IP address assigned to the instance"
  value       = google_compute_instance.default.network_interface.0.network_ip
}

output "external_ip" {
  description = "The external IP address assigned to the instance, if applicable"
  value       = try(google_compute_instance.default.network_interface.0.access_config.0.nat_ip, null)
}

output "instance_details" {
  description = "All details of the instance"
  sensitive   = true
  value       = google_compute_instance.default
}
