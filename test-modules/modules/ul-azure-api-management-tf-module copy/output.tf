output "apim_id" {
    value = azurerm_api_management.apim_service.id
    description = "The id of the API Management Service"
}

output "apim_name" {
    value = azurerm_api_management.apim_service.name
    description = "The name of the API Management Service"
}

