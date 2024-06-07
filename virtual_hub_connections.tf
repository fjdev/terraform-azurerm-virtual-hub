resource "azurerm_virtual_hub_connection" "vhub_con" {
  for_each = var.virtual_hub_connections != null ? var.virtual_hub_connections.remote_virtual_networks : {}

  name                      = "con-${azurerm_virtual_hub.vhub.name}-to-${each.key}"
  virtual_hub_id            = azurerm_virtual_hub.vhub.id
  remote_virtual_network_id = "/subscriptions/${each.value.subscription_id}/resourceGroups/${each.value.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${each.key}"
  internet_security_enabled = coalesce(each.value.internet_security_enabled, var.virtual_hub_connections.internet_security_enabled, false)

  dynamic "routing" {
    for_each = coalesce(each.value.routing, var.virtual_hub_connections.routing) != null ? [coalesce(each.value.routing, var.virtual_hub_connections.routing)] : []

    content {
      associated_route_table_id = routing.value.associated_route_table_id
      inbound_route_map_id      = routing.value.inbound_route_map_id
      outbound_route_map_id     = routing.value.outbound_route_map_id

      dynamic "propagated_route_table" {
        for_each = routing.value.propagated_route_tables != null ? [routing.value.propagated_route_tables] : []

        content {
          labels          = propagated_route_table.value.labels
          route_table_ids = propagated_route_table.value.route_table_ids
        }
      }

      static_vnet_local_route_override_criteria = routing.value.static_vnet_local_route_override_criteria

      dynamic "static_vnet_route" {
        for_each = routing.value.static_vnet_routes != null ? [routing.value.static_vnet_routes] : []

        content {
          name                = static_vnet_route.value.name
          address_prefixes    = static_vnet_route.value.address_prefixes
          next_hop_ip_address = static_vnet_route.value.next_hop_ip_address
        }
      }
    }
  }
}
