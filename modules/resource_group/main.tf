#Resources which will be created
# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "DEV-RG01"
  location = "East US"
  tags     = local.terratag_added_main
}

locals {
  terratag_added_main = {"ENV"="DEV"}
}

