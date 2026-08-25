data "azurerm_subnet" "sbnet" {
    for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "publicip" {
    for_each = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "keyvault" {
  for_each = var.vms
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "kvaultsecretusername" {
  for_each = var.vms
  name         = each.value.secretname_username
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_key_vault_secret" "kvaultsecretpassword" {
  for_each = var.vms
  name         = each.value.secretname_password
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}