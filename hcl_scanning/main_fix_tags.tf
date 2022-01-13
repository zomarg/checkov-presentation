provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "testrg" {
  name     = "resourceGroupName"
  location = "westus"
}

resource "azurerm_storage_account" "testsa" {
  #checkov:skip=CKV2_AZURE_1:The storage account doesent include sensitive data
  #checkov:skip=CKV2_AZURE_18:The storage account doesent include sensitive data
  name                      = "storageaccountname"
  resource_group_name       = azurerm_resource_group.testrg.name
  location                  = "westus"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  default_action            = "Deny"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
  tags = {
    BusinessOwner = "GK"
  }
}