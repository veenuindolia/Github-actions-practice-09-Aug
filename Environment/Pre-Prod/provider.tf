terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "sakv-rg"
    storage_account_name = "vnubackendstorage"
    container_name       = "vmbackendcontainer"
    key                  = "pre-prod-new2.tfstate"
  }
}

provider "azurerm" {
  features {}
}