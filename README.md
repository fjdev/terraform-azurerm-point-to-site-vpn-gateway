<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_point_to_site_vpn_gateway.p2svpng](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/point_to_site_vpn_gateway) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connection_configurations"></a> [connection\_configurations](#input\_connection\_configurations) | (Required) A connection\_configuration block as defined below. | <pre>object({<br>    name = string<br>    vpn_client_address_pool = object({<br>      address_prefixes = list(string)<br>    })<br>    route = optional(object({<br>      associated_route_table_id = string<br>      inbound_route_map_id      = optional(string)<br>      outbound_route_map_id     = optional(string)<br>      propagated_route_table = optional(object({<br>        ids    = list(string)<br>        labels = optional(list(string))<br>      }))<br>    }))<br>    internet_security_enabled = optional(bool)<br>  })</pre> | n/a | yes |
| <a name="input_deploy_resource_group"></a> [deploy\_resource\_group](#input\_deploy\_resource\_group) | (Optional) Specifies whether to deploy the resource group or not. Defaults to true. | `bool` | `true` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (Optional) A list of IP Addresses of DNS Servers for the Point-to-Site VPN Gateway. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | (Optional) The ID of the resource or application that manages this Resource Group. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Point-to-Site VPN Gateway. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Point-to-Site VPN Gateway. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_routing_preference_internet_enabled"></a> [routing\_preference\_internet\_enabled](#input\_routing\_preference\_internet\_enabled) | (Optional) Is the Routing Preference for the Public IP Interface of the VPN Gateway enabled? Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_scale_unit"></a> [scale\_unit](#input\_scale\_unit) | (Required) The Scale Unit for this Point-to-Site VPN Gateway. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resources | `any` | `null` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | (Required) The ID of the Virtual Hub where this Point-to-Site VPN Gateway should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_vpn_server_configuration_id"></a> [vpn\_server\_configuration\_id](#input\_vpn\_server\_configuration\_id) | (Required) The ID of the VPN Server Configuration which this Point-to-Site VPN Gateway should use. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Point-to-Site VPN Gateway. |
<!-- END_TF_DOCS -->