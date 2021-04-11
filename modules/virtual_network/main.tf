#Resources which will be created
resource "azurerm_virtual_network" "vnet" {
  name                = "prod-vnet1"
  address_space       = ["10.30.0.0/16"]
  location            = "East US"
  resource_group_name = "DEV-RG01"
  tags                = local.terratag_added_main
}

resource "azurerm_subnet" "internal" {
  name                 = "internal_subnet"
  address_prefixes     = ["10.30.2.0/24"]
  resource_group_name  = "DEV-RG01"
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet_network_security_group_association" "nsga1" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = var.nsg_id
  depends_on                = [azurerm_subnet.internal]
}


locals {
  terratag_added_main = {"ENV"="DEV"}
}

