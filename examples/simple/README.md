<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm"></a> [vm](#module\_vm) | github.com/mscribellito/terraform-google-vm-instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_disk_image"></a> [boot\_disk\_image](#input\_boot\_disk\_image) | The image from which to initialize this disk. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A unique name for the VM instance, required by GCE. | `string` | `"simple"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the VM instance belongs. | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Whether an external IP address will be associated with the VM instance. | `bool` | `true` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The service account e-mail address. | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name or self\_link of the subnetwork to attach this VM instance to. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that the VM instance should be created in. | `string` | `"us-east1-b"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->