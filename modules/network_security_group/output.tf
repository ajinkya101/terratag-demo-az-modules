output "nsg_01" {
  description = "id of the 1st security group provisioned"
  value       = azurerm_network_security_group.nsg1.id
}