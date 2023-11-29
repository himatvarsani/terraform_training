# API Management Creation
resource "azurerm_api_management" "apim_service" {
  name                = var.apim_name
  location            = var.location
  resource_group_name = var.rgroup_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email

  sku_name = format("%s_%s", var.sku_name, var.sku_capacity)

  tags = var.tags
}

# An API within APIM
resource "azurerm_api_management_api" "mapi" {
  depends_on            = [azurerm_api_management.apim_service]
  for_each              = var.apis
  name                  = each.value.api_name
  resource_group_name   = var.rgroup_name
  api_management_name   = var.apim_name
  revision              = each.value.revision
  display_name          = each.value.api_display_name
  path                  = each.value.path
  protocols             = each.value.protocols
  service_url           = each.value.service_url
  subscription_required = each.value.subscription


  import {
    content_format = var.content_format
    content_value  = var.content_value
  }
}
