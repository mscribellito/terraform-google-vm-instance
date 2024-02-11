# terraform-google-vm-instance

This module allows you to manage a VM instance, `google_compute_instance` resource, within GCE.

## Examples

Examples of how to use these modules can be found in the [examples](examples) folder.

## Project APIs

The following APIs must be enabled on your project:

- `compute.googleapis.com`

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_disk_auto_delete"></a> [boot\_disk\_auto\_delete](#input\_boot\_disk\_auto\_delete) | Whether the disk will be auto-deleted when the VM instance is deleted. | `bool` | `true` | no |
| <a name="input_boot_disk_image"></a> [boot\_disk\_image](#input\_boot\_disk\_image) | The image from which to initialize this disk. | `string` | n/a | yes |
| <a name="input_boot_disk_mode"></a> [boot\_disk\_mode](#input\_boot\_disk\_mode) | The mode in which to attach this disk. | `string` | `"READ_WRITE"` | no |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | The size of the image in gigabytes. | `number` | `20` | no |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | The GCE disk type. | `string` | `"pd-standard"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of key/value label pairs to assign to the VM instance. | `map(string)` | `null` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type to create. | `string` | `"e2-micro"` | no |
| <a name="input_metadata_startup_script"></a> [metadata\_startup\_script](#input\_metadata\_startup\_script) | User startup script to run when VM instances spin up. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique name for the VM instance, required by GCE. | `string` | n/a | yes |
| <a name="input_nat_ip"></a> [nat\_ip](#input\_nat\_ip) | The IP address that will be 1:1 mapped to the VM instance's public network ip. | `string` | `null` | no |
| <a name="input_network_tier"></a> [network\_tier](#input\_network\_tier) | The networking tier used for configuring this VM instance. | `string` | `"STANDARD"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the VM instance belongs. | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Whether an external IP address will be associated with the VM instance. | `bool` | `false` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The service account e-mail address. | `string` | n/a | yes |
| <a name="input_service_account_scopes"></a> [service\_account\_scopes](#input\_service\_account\_scopes) | A list of service scopes. | `list(string)` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name or self\_link of the subnetwork to attach this VM instance to. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of network tags to attach to the VM instance. | `list(string)` | `[]` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that the VM instance should be created in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of instance. |
| <a name="output_image"></a> [image](#output\_image) | Self-link of the image. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | Server-assigned unique identifier of this instance. |
| <a name="output_labels"></a> [labels](#output\_labels) | Labels that will be associated with the instance. |
| <a name="output_name"></a> [name](#output\_name) | Name of instance. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IP address assigned to the instance. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IP address assigned to the instance. |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | Self-link of the instance. |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | Service account attached to the instance. |
| <a name="output_status"></a> [status](#output\_status) | Current status of the instance. |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags that will be associated with the instance. |
| <a name="output_zone"></a> [zone](#output\_zone) | Zone that the instance is located in. |
<!-- END_TF_DOCS -->