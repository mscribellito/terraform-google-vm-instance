# terraform-google-vm-instance

Terraform module which creates a VM instance on Google Cloud.
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
| [google_compute_disk_resource_policy_attachment.attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk_resource_policy_attachment) | resource |
| [google_compute_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_stopping_for_update"></a> [allow\_stopping\_for\_update](#input\_allow\_stopping\_for\_update) | If true, allows Terraform to stop the instance to update its properties. | `bool` | `false` | no |
| <a name="input_boot_disk"></a> [boot\_disk](#input\_boot\_disk) | The boot disk for the instance. | <pre>object({<br>    auto_delete = optional(bool, false)<br>    type        = optional(string, "pd-standard")<br>    size        = optional(number, 10)<br>  })</pre> | <pre>{<br>  "auto_delete": false,<br>  "size": 10,<br>  "type": "pd-standard"<br>}</pre> | no |
| <a name="input_can_ip_forward"></a> [can\_ip\_forward](#input\_can\_ip\_forward) | Whether to allow sending and receiving of packets with non-matching source or destination IPs. | `bool` | `false` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection on this instance. | `bool` | `true` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | A custom hostname for the instance. | `string` | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | The image from which to initialize this instance. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of key/value label pairs to assign to the instance. | `map(string)` | `{}` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type to create. | `string` | `"e2-micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique name for the resource, required by GCE. | `string` | n/a | yes |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | Network to attach to the instance. | <pre>object({<br>    subnetwork = string<br>    network_ip = optional(string, null)<br>    access_config = optional(object({<br>      nat_ip       = optional(string, null)<br>      network_tier = optional(string, "PREMIUM")<br>    }), null)<br>  })</pre> | n/a | yes |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | A list of network tags to attach to the instance. | `list(string)` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the instance should be created. | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to attach to the instance. | <pre>object({<br>    email  = optional(string, null)<br>    scopes = optional(list(string), [])<br>  })</pre> | <pre>{<br>  "email": null,<br>  "scopes": []<br>}</pre> | no |
| <a name="input_shielded_instance_config"></a> [shielded\_instance\_config](#input\_shielded\_instance\_config) | Enable Shielded VM on this instance. | <pre>object({<br>    enable_secure_boot          = optional(bool, false)<br>    enable_vtpm                 = optional(bool, true)<br>    enable_integrity_monitoring = optional(bool, true)<br>  })</pre> | <pre>{<br>  "enable_integrity_monitoring": true,<br>  "enable_secure_boot": false,<br>  "enable_vtpm": true<br>}</pre> | no |
| <a name="input_snapshot_schedule"></a> [snapshot\_schedule](#input\_snapshot\_schedule) | The snapshot schedule to attach to the instance boot disk. | `string` | `null` | no |
| <a name="input_startup_script"></a> [startup\_script](#input\_startup\_script) | User startup script to run when instances spin up. | `string` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that the machine should be created in. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | The external ip address of the instance, either manually or dynamically assigned. |
| <a name="output_id"></a> [id](#output\_id) | The identifier of the created resource. |
| <a name="output_instance_details"></a> [instance\_details](#output\_instance\_details) | All details of the instance. |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | The internal ip address of the instance, either manually or dynamically assigned. |
| <a name="output_name"></a> [name](#output\_name) | The name of the created resource. |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource. |
<!-- END_TF_DOCS -->