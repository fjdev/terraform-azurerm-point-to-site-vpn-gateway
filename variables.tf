variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Point-to-Site VPN Gateway. Changing this forces a new resource to be created."
}

variable "deploy_resource_group" {
  type        = bool
  default     = true
  description = "(Optional) Specifies whether to deploy the resource group or not. Defaults to true."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Point-to-Site VPN Gateway. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "connection_configuration" {
  type        = object({})
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

variable "dns_servers" {
  type        = list(string)
  default     = null
  description = "(Optional) A list of IP Addresses of DNS Servers for the Point-to-Site VPN Gateway."
}

variable "routing_preference_internet_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Is the Routing Preference for the Public IP Interface of the VPN Gateway enabled? Defaults to false. Changing this forces a new resource to be created."
}

variable "managed_by" {
  type        = string
  default     = null
  description = "(Optional) The ID of the resource or application that manages this Resource Group."
}

variable "tags" {
  type        = any
  default     = null
  description = "(Optional) A mapping of tags to assign to the Point-to-Site VPN Gateway."
}

variable "vpn_server_configuration" {
  type = object({
    name                     = string
    vpn_authentication_types = string
    ipsec_policy = optional(object({
      dh_group               = string
      ike_encryption         = string
      ike_integrity          = string
      ipsec_encryption       = string
      ipsec_integrity        = string
      pfs_group              = string
      sa_lifetime_seconds    = number
      sa_data_size_kilobytes = number
    }))
    vpn_protocols = optional(list(string))
    azure_active_directory_authentication = optional(object({
      audience = string
      issuer   = string
      tenant   = string
    }))
    client_root_certificate = optional(map(object({
      public_cert_data = string
    })))
    client_revoked_certificate = optional(map(object({
      thumbprint = string
    })))
    radius = optional(object({
      server = map(object({
        address = string
        secret  = string
        score   = number
      }))
      client_root_certificate = optional(map(object({
        thumbprint = string
      })))
      server_root_certificate = optional(map(object({
        public_cert_data = string
      })))
    }))
  })
  description = "(Required) A vpn_server_configuration block as defined below."
}
