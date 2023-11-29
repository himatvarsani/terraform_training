
# Resource Group
resource "azurerm_resource_group" "function_app_rg" {
  name     = "${var.resource_group_name}_rg"
  location = var.location
}

# Service plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.function_app_rg.name
  location            = azurerm_resource_group.function_app_rg.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

# Storage Account
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.function_app_rg.name
  location                 = azurerm_resource_group.function_app_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

# Function App Module
module "function_app" {
  source                      = "../"
  function_app_name           = var.function_app_name
  location                    = var.location
  resource_group_name         = azurerm_resource_group.function_app_rg.name
  service_plan_id             = azurerm_service_plan.app_service_plan.id
  #service_plan_name           = azurerm_service_plan.app_service_plan.name
  storage_account_name        = azurerm_storage_account.storage_account.name
  # storage_account_access_key  = azurerm_storage_account.storage_account.primary_access_key
  # https_only                  = var.https_only
  # version                   = var.function_version
  os_type                     = var.os_type 
  tags                        = var.tags
  # runtime                     = var.runtime

  depends_on = [
    azurerm_service_plan.app_service_plan
  ]

}


# resource "azurerm_function_app_function" "example" {
#   name            = "example-function-app-function"
#   function_app_id = azurerm_linux_function_app.example.id
#   language        = "Python"
#   test_data = jsonencode({
#     "name" = "Azure"
#   })
#   config_json = jsonencode({
#     "bindings" = [
#       {
#         "authLevel" = "function"
#         "direction" = "in"
#         "methods" = [
#           "get",
#           "post",
#         ]
#         "name" = "req"
#         "type" = "httpTrigger"
#       },
#       {
#         "direction" = "out"
#         "name"      = "$return"
#         "type"      = "http"
#       },
#     ]
#   })
# }