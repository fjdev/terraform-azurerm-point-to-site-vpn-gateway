# Resource Group
resource "azurerm_resource_group" "rg" {
  count = var.deploy_resource_group ? 1 : 0

  name       = var.resource_group_name
  location   = var.location
  managed_by = var.managed_by
  tags       = try(var.tags.resource_group, null)
}

# Point-to-Site VPN Gateway
resource "azurerm_point_to_site_vpn_gateway" "p2svpng" {
  name                = var.name
  resource_group_name = var.deploy_resource_group ? azurerm_resource_group.rg[0].name : var.resource_group_name
  location            = var.location

  connection_configuration {
    name = var.connection_configuration.name

    vpn_client_address_pool {
      address_prefixes = var.connection_configuration.vpn_client_address_pool.address_prefixes
    }

    dynamic "route" {
      for_each = var.connection_configuration.route != null ? [var.connection_configuration.route] : []

      content {
        associated_route_table_id = route.value.associated_route_table_id
        inbound_route_map_id      = route.value.inbound_route_map_id
        outbound_route_map_id     = route.value.outbound_route_map_id

        dynamic "propagated_route_table" {
          for_each = route.value.propagated_route_table != null ? [route.value.propagated_route_table] : []

          content {
            ids    = propagated_route_table.value.ids
            labels = propagated_route_table.value.labels
          }
        }
      }
    }

    internet_security_enabled = var.connection_configuration.internet_security_enabled
  }

  scale_unit                          = var.scale_unit
  virtual_hub_id                      = var.virtual_hub_id
  vpn_server_configuration_id         = var.vpn_server_configuration_id
  dns_servers                         = var.dns_servers
  routing_preference_internet_enabled = var.routing_preference_internet_enabled
  tags                                = var.deploy_resource_group ? try(var.tags.point_to_site_vpn_gateway, null) : var.tags
}
