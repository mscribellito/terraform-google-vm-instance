output "instance_details" {
  description = "List of all details for compute instance."
  sensitive   = true
  value       = google_compute_instance.compute_instance
}