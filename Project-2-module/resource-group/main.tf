//Resource Group

resource "azurerm_resource_group" "project2-rg" {
  name = var.resource_name
  location = var.location
}