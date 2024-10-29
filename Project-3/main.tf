terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"           // Create a Resource Group using Terraform

}
 
provider "azurerm" {
    features {}
}

module "rg" {
  source = "../Project-3-module/resource-group"
  resource_name = var.resource_name
  location = var.location
}

module "vnet" {
  source = "../Project-3-module/vnet"
  for_each = var.vnets
  vnet_name = each.key
  address_space = [ each.value.address_space ]
  resource_name = module.rg.resource_name
  location = module.rg.location

  depends_on = [ module.rg ]
}

module "subnets" {
  source = "../Project-3-module/subnet"
  for_each = var.subnets
  subnet_name = each.value.subnet_name
  address_prefix = each.value.address_prefix
  resource_name = module.rg.resource_name
  virtual_name = module.vnet["project3_vnet"].name

  depends_on = [ module.rg, module.vnet ]
}

module "nsg" {
  source = "../Project-3-module/nsg"
  for_each = var.nsg
  nsg_name = each.key
  resource_name = module.rg.resource_name
  location = module.rg.location

  depends_on = [ module.rg, module.vnet ]
}

module "nsg_rule" {
  source = "../Project-3-module/nsg-rule"
  for_each = var.security_rules
  nsg_name = each.key
  resource_name = module.rg.resource_name
  location = module.rg.location
  
  name                       = each.value.name
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix

    depends_on = [ module.nsg ]
}

module "route_table" {
  source = "../Project-3-module/route-table"
  for_each = var.route_tables
  route_table_name = each.key
  resource_name = module.rg.resource_name
  location = module.rg.location
  depends_on = [ module.rg, module.vnet, module.subnets, module.nsg ]
}