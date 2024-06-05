output "id" {
  value       = azurerm_virtual_hub.vhub.id
  description = "The ID of the Virtual Hub."
}

output "default_route_table_id" {
  value       = azurerm_virtual_hub.vhub.default_route_table_id
  description = "The ID of the default Route Table in the Virtual Hub."
}

output "virtual_router_asn" {
  value       = azurerm_virtual_hub.vhub.virtual_router_asn
  description = "The Autonomous System Number of the Virtual Hub BGP router."
}

output "virtual_router_ips" {
  value       = azurerm_virtual_hub.vhub.virtual_router_ips
  description = "The IP addresses of the Virtual Hub BGP router."
}

output "virtual_router_auto_scale_min_capacity" {
  value       = azurerm_virtual_hub.vhub.virtual_router_auto_scale_min_capacity
  description = "Minimum instance capacity for the scaling configuration of the Virtual Hub Router."
}
