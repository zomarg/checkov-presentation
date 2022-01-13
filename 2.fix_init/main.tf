provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "testrg" {
  name     = "resourceGroupName"
  location = "westus"
}    

resource "azurerm_storage_account" "testsa" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.testrg.name
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  queue_properties  {
   logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
  tags = {
    environment = "staging"
  }
}