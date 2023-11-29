output "function_app_name" {
  value = module.function_app.function_app_name
}

# output "objectId" {
#   value = azurerm_linux_function_app.function_app.identity.0.principal_id
# }

output "service_plan_id" {
  value = azurerm_service_plan.app_service_plan.id
}

# output "name" {
#   value = module.function_app.name
# }

# output "storage_account_name" {
#   value = module.function_app.azurerm_storage_account.storage_account
# }