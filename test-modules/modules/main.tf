data "azurerm_resource_group" "function_rg" {
    name = var.resource_group_name
    count = var.resource_group_location == null ? 1: 0
}

# Create the Azure Storage Account
resource "azurerm_storage_account" "storage_account" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = local.resource_group_location.locatiion
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
}

# Create Azure Storage Container????
# resource "azurerm_storage_container" "storage_container" {
#   name                      = "contents"
#   storstorage_account_name  = azurerm_storage_account.storage_account.name
#   container_access_type     = "private" 
# }


# Monitor function app
# Create Azurerm App Insight
resource "azurerm_application_insights" "application_insights" {
  name                      = var.application_insight_name
  location                  = local.resource_group_location.location
  resource_group_name       = data.azurerm_resource_group.function_rg
  application_type          = "web"
  
  tags = {
    "monitoring" = "functionApp"
  } 
}

# Create Azurerm App Service Plan
resource "azurerm_app_service_plan" "app_service_plan" {
  name                      = var.service_plan_name
  location                  = local.resource_group_location
  resource_group_name       = data.azurerm_resource_group.function_rg
  kind                      = "FunctionApp"
  reserved                  = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Create AzureRm Function App
resource "azurerm_function_app" "function_app" {
  name                        = var.function_app_name
  location                    = local.resource_group_location.location
  resource_group_name         = data.azurerm_resource_group.function_rg
  app_service_plan_id         = azurerm_app_service_plan.app_service_plan.id
  storage_account_name        = azurerm_storage_account.storage_account.name
  storage_account_access_key  = azurerm_storage_account.storage_account.primary_access_key
  https_only                  = var.https_only
  version                     = var.function_app_version
  os_type                     = var.os_type 
}

