//Resource Group

resource "azurerm_resource_group" "project3-rg" {
  name = var.resource_name
  location = var.location
}