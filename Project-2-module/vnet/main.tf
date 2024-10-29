
resource "azurerm_virtual_network" "vnet" {  
name                = var.vnet_name 
location            = var.location
resource_group_name = var.resource_name 
address_space = var.address_space
}