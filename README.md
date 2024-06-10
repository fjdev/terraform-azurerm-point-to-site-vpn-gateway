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
| [azurerm_point_to_site_vpn_gateway.p2s_vpng](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/point_to_site_vpn_gateway) | resource |
| [azurerm_vpn_server_configuration.vpnsc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_server_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connection_configuration"></a> [connection\_configuration](#input\_connection\_configuration) | (Required) A connection\_configuration block as defined below. | `object({})` | n/a | yes |
| <a name="input_deploy_resource_group"></a> [deploy\_resource\_group](#input\_deploy\_resource\_group) | (Optional) Specifies whether to deploy the resource group or not. Defaults to true. | `bool` | `true` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (Optional) A list of IP Addresses of DNS Servers for the Point-to-Site VPN Gateway. | `list(string)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | (Optional) The ID of the resource or application that manages this Resource Group. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Point-to-Site VPN Gateway. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Point-to-Site VPN Gateway. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_routing_preference_internet_enabled"></a> [routing\_preference\_internet\_enabled](#input\_routing\_preference\_internet\_enabled) | (Optional) Is the Routing Preference for the Public IP Interface of the VPN Gateway enabled? Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_scale_unit"></a> [scale\_unit](#input\_scale\_unit) | (Required) The Scale Unit for this Point-to-Site VPN Gateway. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the Point-to-Site VPN Gateway. | `any` | `null` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | (Required) The ID of the Virtual Hub where this Point-to-Site VPN Gateway should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_vpn_server_configuration"></a> [vpn\_server\_configuration](#input\_vpn\_server\_configuration) | (Required) A vpn\_server\_configuration block as defined below. | <pre>object({<br>    name                     = string<br>    vpn_authentication_types = string<br>    ipsec_policy = optional(object({<br>      dh_group               = string<br>      ike_encryption         = string<br>      ike_integrity          = string<br>      ipsec_encryption       = string<br>      ipsec_integrity        = string<br>      pfs_group              = string<br>      sa_lifetime_seconds    = number<br>      sa_data_size_kilobytes = number<br>    }))<br>    vpn_protocols = optional(list(string))<br>    azure_active_directory_authentication = optional(object({<br>      audience = string<br>      issuer   = string<br>      tenant   = string<br>    }))<br>    client_root_certificate = optional(map(object({<br>      public_cert_data = string<br>    })))<br>    client_revoked_certificate = optional(map(object({<br>      thumbprint = string<br>    })))<br>    radius = optional(object({<br>      server = map(object({<br>        address = string<br>        secret  = string<br>        score   = number<br>      }))<br>      client_root_certificate = optional(map(object({<br>        thumbprint = string<br>      })))<br>      server_root_certificate = optional(map(object({<br>        public_cert_data = string<br>      })))<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Point-to-Site VPN Gateway. |
<!-- END_TF_DOCS -->