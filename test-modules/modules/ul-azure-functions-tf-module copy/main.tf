
# Create AzureRm Function App - Window
resource "azurerm_windows_function_app" "function_app" {
  count = var.os_type == "Windows" ? 1 : 0
  name                        = var.function_app_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  service_plan_id             = var.service_plan_id
  storage_account_name        = var.storage_account_name 
  # storage_account_access_key  = azurerm_storage_account.storage_account.primary_access_key
  #https_only                  = var.https_only
  tags                        = var.tags

#   identity {
#     type = "SystemAssigned"  
#   } 
  
#   app_settings = {
#     FUNCTIONS_WORKER_RUNTIME = var.functions_worker_runtime
#     WEBSITE_RUN_FROM_PACKAGE = var.website_run_from_package
#   }

  site_config {
    # application_stack {
    #   dotnet_version              = var.runtime.dotnet_version
    #   java_version                = var.runtime.java_version
    #   node_version                = var.runtime.node_version
    #   #python_version              = var.runtime.python_version
    #   powershell_core_version     = var.runtime.powershell_core_version
    #   # use_custom_runtime          = var.runtime.use_custom_runtime
    # }
  }
}


# Create AzureRm Function App - Linux
resource "azurerm_linux_function_app" "function_app" {
  count = var.os_type == "Linux" ? 1 : 0
  name                        = var.function_app_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  service_plan_id             = var.service_plan_id
  storage_account_name        = var.storage_account_name 
  # storage_account_access_key  = azurerm_storage_account.storage_account.primary_access_key
  #https_only                  = var.https_only
  tags                        = var.tags

  # identity {
  #   type = "SystemAssigned"  
  # } 
  
  # app_settings = {
  #   FUNCTIONS_WORKER_RUNTIME = var.functions_worker_runtime
  #   WEBSITE_RUN_FROM_PACKAGE = var.website_run_from_package
  # }

  site_config {
    # application_stack {
    #   dotnet_version              = var.runtime.dotnet_version
    #   java_version                = var.runtime.java_version
    #   node_version                = var.runtime.node_version
    #   python_version              = var.runtime.python_version
    #   powershell_core_version     = var.runtime.powershell_core_version
      # use_custom_runtime          = var.runtime.use_custom_runtime
    # }
  }
}




