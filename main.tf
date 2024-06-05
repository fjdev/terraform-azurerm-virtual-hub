resource "azurerm_virtual_hub" "vhub" {
  name                   = var.name
  resource_group_name    = var.deploy_resource_group ? module.resource_group[0].name : var.resource_group_name
  location               = var.location
  address_prefix         = var.address_prefix
  hub_routing_preference = var.hub_routing_preference

  dynamic "route" {
    for_each = var.routes != null ? { for index, route in var.routes : index => route } : {}

    content {
      address_prefixes    = route.value.address_prefixes
      next_hop_ip_address = route.value.next_hop_ip_address
    }
  }

  sku            = var.sku
  virtual_wan_id = var.virtual_wan_id
  tags           = try(var.tags.virtual_hub, null)
}
