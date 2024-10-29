output "security_rules" {
  value = azurerm_network_security_rule.security_rules
}

output "nsg_name" {
  value = azurerm_network_security_rule.security_rules.network_security_group_name
}
