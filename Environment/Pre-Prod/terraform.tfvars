prgs = {
  rg1 = {
    name     = "Pre-Prod_RG"
    location = "centralindia"
  }
   rg2 = {
    name     = "Pre-Prod_RG2"
    location = "centralindia"
  }
}

pvnets = {
  vnet1 = {
    name                = "Pre-Prod_Vnet"
    location            = "centralindia"
    resource_group_name = "Pre-Prod_RG"
    address_space       = ["10.50.0.0/16"]
  }
}

psnets = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "Pre-Prod_RG"
    virtual_network_name = "Pre-Prod_Vnet"
    address_prefixes     = ["10.50.1.0/24"]
  }

  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "Pre-Prod_RG"
    virtual_network_name = "Pre-Prod_Vnet"
    address_prefixes     = ["10.50.2.0/24"]
  }
}

ppips = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "Pre-Prod_RG"
    location            = "centralindia"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "backend-pip"
    resource_group_name = "Pre-Prod_RG"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

pvms = {
  vm1 = {
    nic_name             = "frontend-nic"
    resource_group_name  = "Pre-Prod_RG"
    location             = "centralindia"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "Pre-Prod_Vnet"
    pip_name             = "frontend-pip"
    vm_name              = "frontend-vm"
    size                 = "Standard_D2s_v3"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    keyvault_name        = "kv-vm-veenu"
    rg_name              = "sakv-rg"
    secretname_username  = "vm-username"
    secretname_password  = "vm-password"


  }

  vm2 = {
    nic_name             = "backend-nic"
    resource_group_name  = "Pre-Prod_RG"
    location             = "centralindia"
    subnet_name          = "backend-subnet"
    virtual_network_name = "Pre-Prod_Vnet"
    pip_name             = "backend-pip"
    vm_name              = "backend-vm"
    size                 = "Standard_D2s_v3"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    keyvault_name        = "kv-vm-veenu"
    rg_name              = "sakv-rg"
    secretname_username  = "vm-username"
    secretname_password  = "vm-password"


  }
}