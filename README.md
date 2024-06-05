<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | github.com/fjdev/terraform-azurerm-resource-group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_hub.vhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix) | (Optional) The Address Prefix which should be used for this Virtual Hub. Changing this forces a new resource to be created. The address prefix subnet cannot be smaller than a /24. Azure recommends using a /23. | `string` | `null` | no |
| <a name="input_deploy_resource_group"></a> [deploy\_resource\_group](#input\_deploy\_resource\_group) | (Optional) Specifies whether to deploy the resource group or not. Defaults to true. | `bool` | `true` | no |
| <a name="input_hub_routing_preference"></a> [hub\_routing\_preference](#input\_hub\_routing\_preference) | (Optional) The hub routing preference. Possible values are ExpressRoute, ASPath and VpnGateway. Defaults to ExpressRoute. | `string` | `"ExpressRoute"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the Virtual Hub should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | (Optional) The ID of the resource or application that manages this Resource Group. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Virtual Hub. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the name of the Resource Group where the Virtual Hub should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_route"></a> [route](#input\_route) | (Optional) One or more route blocks as defined below. | <pre>list(object({<br>    address_prefixes    = list(string)<br>    next_hop_ip_address = string<br>  }))</pre> | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) The SKU of the Virtual Hub. Possible values are Basic and Standard. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the Virtual Hub. | `any` | `null` | no |
| <a name="input_virtual_wan_id"></a> [virtual\_wan\_id](#input\_virtual\_wan\_id) | (Optional) The ID of a Virtual WAN within which the Virtual Hub should be created. Changing this forces a new resource to be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | The ID of the default Route Table in the Virtual Hub. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Virtual Hub. |
| <a name="output_virtual_router_asn"></a> [virtual\_router\_asn](#output\_virtual\_router\_asn) | The Autonomous System Number of the Virtual Hub BGP router. |
| <a name="output_virtual_router_auto_scale_min_capacity"></a> [virtual\_router\_auto\_scale\_min\_capacity](#output\_virtual\_router\_auto\_scale\_min\_capacity) | Minimum instance capacity for the scaling configuration of the Virtual Hub Router. |
| <a name="output_virtual_router_ips"></a> [virtual\_router\_ips](#output\_virtual\_router\_ips) | The IP addresses of the Virtual Hub BGP router. |
<!-- END_TF_DOCS -->