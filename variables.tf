variable "name" {
  type        = string
  description = "(Required) The name of the Virtual Hub. Changing this forces a new resource to be created."
}

variable "deploy_resource_group" {
  type        = bool
  default     = true
  description = "(Optional) Specifies whether to deploy the resource group or not. Defaults to true."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group where the Virtual Hub should exist. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the Virtual Hub should exist. Changing this forces a new resource to be created."
}

variable "address_prefix" {
  type        = string
  default     = null
  description = "(Optional) The Address Prefix which should be used for this Virtual Hub. Changing this forces a new resource to be created. The address prefix subnet cannot be smaller than a /24. Azure recommends using a /23."
}

variable "hub_routing_preference" {
  type        = string
  default     = "ExpressRoute"
  description = "(Optional) The hub routing preference. Possible values are ExpressRoute, ASPath and VpnGateway. Defaults to ExpressRoute."
}

variable "routes" {
  type = list(object({
    address_prefixes    = list(string)
    next_hop_ip_address = string
  }))
  default     = null
  description = "(Optional) One or more route blocks as defined below."
}

variable "sku" {
  type        = string
  default     = null
  description = "(Optional) The SKU of the Virtual Hub. Possible values are Basic and Standard. Changing this forces a new resource to be created."
}

variable "virtual_wan_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of a Virtual WAN within which the Virtual Hub should be created. Changing this forces a new resource to be created."
}

variable "managed_by" {
  type        = string
  default     = null
  description = "(Optional) The ID of the resource or application that manages this Resource Group."
}

variable "tags" {
  type        = any
  default     = null
  description = "(Optional) A mapping of tags to assign to the Virtual Hub."
}

variable "virtual_hub_connections" {
  type = object({
    internet_security_enabled = optional(bool)
    routing = optional(object({
      associated_route_table_id = optional(string)
      inbound_route_map_id      = optional(string)
      outbound_route_map_id     = optional(string)
      propagated_route_tables = optional(object({
        labels          = optional(list(string))
        route_table_ids = optional(list(string))
      }))
      static_vnet_local_route_override_criteria = optional(string)
      static_vnet_routes = optional(object({
        name                = optional(string)
        address_prefixes    = optional(list(string))
        next_hop_ip_address = optional(string)
      }))
    }))
    remote_virtual_networks = map(object({
      subscription_id           = string
      resource_group_name       = string
      internet_security_enabled = optional(bool)
      routing = optional(object({
        associated_route_table_id = optional(string)
        inbound_route_map_id      = optional(string)
        outbound_route_map_id     = optional(string)
        propagated_route_tables = optional(object({
          labels          = optional(list(string))
          route_table_ids = optional(list(string))
        }))
        static_vnet_local_route_override_criteria = optional(string)
        static_vnet_routes = optional(object({
          name                = optional(string)
          address_prefixes    = optional(list(string))
          next_hop_ip_address = optional(string)
        }))
      }))
    }))
  })
  default     = null
  description = "(Optional) A virtual_hub_connections block as defined below."
}
