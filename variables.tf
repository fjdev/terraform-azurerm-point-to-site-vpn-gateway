variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Point-to-Site VPN Gateway. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Point-to-Site VPN Gateway. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "connection_configurations" {
  type = object({
    name = string
    vpn_client_address_pool = object({
      address_prefixes = list(string)
    })
    route = optional(object({
      associated_route_table_id = string
      inbound_route_map_id      = optional(string)
      outbound_route_map_id     = optional(string)
      propagated_route_table = optional(object({
        ids    = list(string)
        labels = optional(list(string))
      }))
    }))
    internet_security_enabled = optional(bool)
  })
  description = "(Required) A connection_configuration block as defined below."
}

variable "scale_unit" {
  type        = number
  description = "(Required) The Scale Unit for this Point-to-Site VPN Gateway."
}

variable "virtual_hub_id" {
  type        = string
  description = "(Required) The ID of the Virtual Hub where this Point-to-Site VPN Gateway should exist. Changing this forces a new resource to be created."
}

variable "vpn_server_configuration_id" {
  type        = string
  description = "(Required) The ID of the VPN Server Configuration which this Point-to-Site VPN Gateway should use. Changing this forces a new resource to be created."
}

variable "dns_servers" {
  type        = list(string)
  description = "(Optional) A list of IP Addresses of DNS Servers for the Point-to-Site VPN Gateway."
  default     = []
}

variable "routing_preference_internet_enabled" {
  type        = bool
  description = "(Optional) Is the Routing Preference for the Public IP Interface of the VPN Gateway enabled? Defaults to false. Changing this forces a new resource to be created."
  default     = false
}

variable "tags" {
  type        = any
  description = "(Optional) A mapping of tags to assign to the resources"
  default     = null
}

variable "deploy_resource_group" {
  type        = bool
  description = "(Optional) Specifies whether to deploy the resource group or not. Defaults to true."
  default     = true
}

variable "managed_by" {
  type        = string
  default     = null
  description = "(Optional) The ID of the resource or application that manages this Resource Group."
}
