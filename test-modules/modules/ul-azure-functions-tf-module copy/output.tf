output "function_app_name" {
    value = azurerm_linux_function_app.function_app[0].name
}

output "resource_group_name" {
    value = azurerm_linux_function_app.function_app[0].resource_group_name
}

# output "objectId" {
#   value = azurerm_linux_function_app.function_app.identity.0.principal_id
# }

# output "azurerm_linux_function_app" {
#   description = "The Azure Function app resource."
#   value       = element(local.app, 0)
# }

# output "identity" {
#   description = "The managed identity of the app."
#   value       = element(local.app, 0).identity
# }
# output "linux_function_app" {
#   description = "Linux Function App output object if Linux is chosen. Please refer to `./modules/linux-function/README.md`"
#   value       = try(module.linux_function["enabled"], null)
# }

# output "windows_function_app" {
#   description = "Windows Function App output object if Windows is chosen. Please refer to `./modules/windows-function/README.md`"
#   value       = try(module.windows_function["enabled"], null)
# }