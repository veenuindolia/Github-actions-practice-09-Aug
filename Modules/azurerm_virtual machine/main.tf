resource "azurerm_network_interface" "nic" {
    for_each = var.vms
    name = each.value.nic_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location

    ip_configuration {
      name = "internal"
      private_ip_address_allocation = "Dynamic"
      subnet_id = data.azurerm_subnet.sbnet[each.key].id
      public_ip_address_id = data.azurerm_public_ip.publicip[each.key].id
    }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms
  name = each.value.vm_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value.size
  network_interface_ids = [ azurerm_network_interface.nic[each.key].id ]
  admin_username = data.azurerm_key_vault_secret.kvaultsecretusername[each.key].value
  admin_password = data.azurerm_key_vault_secret.kvaultsecretpassword[each.key].value
  disable_password_authentication = false
  


  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

   source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  
}