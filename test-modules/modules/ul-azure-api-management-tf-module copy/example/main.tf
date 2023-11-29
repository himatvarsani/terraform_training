# # Create resource group
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.rgroup_name
}

resource "azurerm_resource_group" "api_management_rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.rgroup_name
  location = var.location
}

module "api_management" {
  source          = "../"
  apim_name       = var.apim_name
  location        = var.location
  rgroup_name     = azurerm_resource_group.api_management_rg.*.name[0]
  publisher_name  = var.publisher_name
  publisher_email = var.publisher_email
  sku_name        = var.sku_name
  sku_capacity    = var.sku_capacity
  tags            = var.tags
  apis            = var.apis

  content_format = var.content_format
  content_value  = var.content_value


}

# # An API within APIM
# resource "azurerm_api_management_api" "mapi" {
#   name                = "example-api"
#   resource_group_name = azurerm_resource_group.example.name
#   api_management_name = azurerm_api_management.example.name
#   revision            = "1"
#   display_name        = "Example API"
#   path                = ""
#   protocols           = ["https", "http"]
#   service_url         = "http://conferenceapi.azurewebsites.net"

#   import {
#     content_format = "swagger-link-json"
#     content_value  = "http://conferenceapi.azurewebsites.net/?format=json"
#   }
# }

# Operations
# resource "azurerm_api_management_api_operation" "operation" {
#   depends_on = [azurerm_api_management_api.api]
#   for_each            = local.operations_flattened_to_map
#   operation_id        = each.value.operation_name
#   api_name            = each.value.api_name
#   resource_group_name = var.resource_group_name
#   api_management_name = azurerm_api_management.apim_service.name
#   display_name        = each.value.operation_display_name
#   method              = each.value.method
#   url_template        = each.value.url_template
#   description         = each.value.description

#   response {
#     status_code = 200
#   }
# }
