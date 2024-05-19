# terraform-google-vm-instance

Terraform module which creates a VM instance on Google Cloud.

## Usage

### Single VM Instance

```hcl
module "hello_world" {
  source = "github.com/mscribellito/terraform-google-vm-instance"

  project_id = "your-project-id"
  name       = "hello-world"
  region     = "us-east1"

  boot_disk = {
    image = "projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2204-jammy-v20240515"
  }

  network_interfaces = [{
    subnetwork = "projects/your-project-id/regions/us-east1/subnetworks/default"
    access_config = {
    }
  }]

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      echo "Hello, World!"
    EOT
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

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
| <a name="input_attached_disks"></a> [attached\_disks](#input\_attached\_disks) | Additional disks to attach to the instance. | <pre>list(object({<br>    source      = string<br>    mode        = optional(string, "READ_WRITE")<br>    device_name = optional(string, null)<br>  }))</pre> | `[]` | no |
| <a name="input_boot_disk"></a> [boot\_disk](#input\_boot\_disk) | The boot disk for the instance. | <pre>object({<br>    image       = string<br>    type        = optional(string, "pd-standard")<br>    size        = optional(number, 10)<br>    auto_delete = optional(bool, false)<br>  })</pre> | `null` | no |
| <a name="input_can_ip_forward"></a> [can\_ip\_forward](#input\_can\_ip\_forward) | Whether to allow sending and receiving of packets with non-matching source or destination IPs. | `bool` | `false` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection on this instance. | `bool` | `true` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | A custom hostname for the instance. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of key/value label pairs to assign to the instance. | `map(string)` | `{}` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type to create. | `string` | `"e2-micro"` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Metadata key/value pairs to make available from within the instance. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique name for the resource, required by GCE. | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | Networks to attach to the instance. | <pre>list(object({<br>    subnetwork = string<br>    network_ip = optional(string, null)<br>    access_config = optional(object({<br>      nat_ip       = optional(string, null)<br>      network_tier = optional(string, "PREMIUM")<br>    }), null)<br>  }))</pre> | `[]` | no |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | A list of network tags to attach to the instance. | `list(string)` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the instance should be created. | `string` | n/a | yes |
| <a name="input_resource_policies"></a> [resource\_policies](#input\_resource\_policies) | A list of self\_links of resource policies to attach to the instance. | `list(string)` | `[]` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to attach to the instance. | <pre>object({<br>    email  = optional(string, null)<br>    scopes = optional(list(string), ["cloud-platform"])<br>  })</pre> | <pre>{<br>  "email": null,<br>  "scopes": []<br>}</pre> | no |
| <a name="input_shielded_instance_config"></a> [shielded\_instance\_config](#input\_shielded\_instance\_config) | Enable Shielded VM on this instance. | <pre>object({<br>    enable_secure_boot          = optional(bool, false)<br>    enable_vtpm                 = optional(bool, true)<br>    enable_integrity_monitoring = optional(bool, true)<br>  })</pre> | <pre>{<br>  "enable_integrity_monitoring": true,<br>  "enable_secure_boot": false,<br>  "enable_vtpm": true<br>}</pre> | no |
| <a name="input_snapshot_schedule"></a> [snapshot\_schedule](#input\_snapshot\_schedule) | The snapshot schedule to attach to the instance boot disk. | `string` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that the machine should be created in. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | The external IP address assigned to the instance, if applicable |
| <a name="output_id"></a> [id](#output\_id) | The identifier of the created resource |
| <a name="output_image"></a> [image](#output\_image) | Image self link that was used to create the instance |
| <a name="output_instance_details"></a> [instance\_details](#output\_instance\_details) | All details of the instance |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The server-assigned unique identifier of this instance |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | The internal IP address assigned to the instance |
| <a name="output_labels"></a> [labels](#output\_labels) | The labels of the instance |
| <a name="output_name"></a> [name](#output\_name) | The name of the created resource |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource |
| <a name="output_status"></a> [status](#output\_status) | The current status of the instance |
| <a name="output_zone"></a> [zone](#output\_zone) | The zone of the instance |
<!-- END_TF_DOCS -->

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)