#-------------------------------------------
# Azure Resource group Module is called here
#-------------------------------------------
module "resource_group_module" {
  source = "./modules/resource_group"
}

#--------------------------------------------------
# Azure Network security group Module is called here
#--------------------------------------------------
module "network_security_group_module" {
  source = "./modules/network_security_group"

  depends_on = [module.resource_group_module]
}

#------------------------------------
# Azure network Module is called here
#------------------------------------
module "network_module" {
  source = "./modules/virtual_network"

  # passing resource id of all NSG to Attach it to the Subnet
  nsg_id      = module.network_security_group_module.nsg_01

  depends_on = [module.resource_group_module, module.network_security_group_module]
}