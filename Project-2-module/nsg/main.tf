resource "azurerm_network_security_group" "nsg" {
  name = var.nsg_name
  resource_group_name = var.resource_name
  location = var.location
}
