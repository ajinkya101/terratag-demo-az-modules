#-------------------------------------------------------
#network security group configuration is specified here.
#-------------------------------------------------------
resource "azurerm_network_security_group" "nsg1" {
  name                = "NetworkSecurityGroup1" # name of 1st network security group
  location            = "East US"               # location of 1st network security group
  resource_group_name = "DEV-RG01"              # specifying resource group name which will be used for resource deployment

  security_rule {
    name                       = "port_80" # nsg rule is set for port 80
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = local.terratag_added_main
}



locals {
  terratag_added_main = {"ENV"="DEV"}
}

