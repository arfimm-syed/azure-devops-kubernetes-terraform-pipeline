

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource-group" {
  name     = "rg-aks-terraform"
  location = "UK South"
}

terraform {
  backend "azurerm" {}

  }




resource "azurerm_storage_account" "storage-acc" {
  name                     = "azurestoragesyed"
  resource_group_name      = azurerm_resource_group.resource-group.name
  location                 = azurerm_resource_group.resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
