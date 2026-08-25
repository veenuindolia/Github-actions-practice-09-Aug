module "resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.prgs
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_virtual_network"
  vnets      = var.pvnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../Modules/azurerm_subnet"
  snets      = var.psnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_public_ip"
  pips       = var.ppips
}

module "virtual_machine" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../Modules/azurerm_virtual machine"
  vms        = var.pvms
}