output "id" {
  description = "The identifier of the created resource."
  value       = google_compute_instance.default.id
}

output "name" {
  description = "The name of the created resource."
  value       = google_compute_instance.default.name
}

output "self_link" {
  description = "The URI of the created resource."
  value       = google_compute_instance.default.self_link
}

output "internal_ip" {
  description = "The internal ip address of the instance, either manually or dynamically assigned."
  value       = google_compute_instance.default.network_interface.0.network_ip
}

output "external_ip" {
  description = "The external ip address of the instance, either manually or dynamically assigned."
  value       = try(google_compute_instance.default.network_interface.0.access_config.0.nat_ip, null)
}
