# locals {
#   function_output = try(module.linux_function["enabled"], module.windows_function["enabled"])
# }

locals {
    resource_group_location = var.resource_group_location == null ? data.azurerm_resource_group.function_rg[0].location : var.resource_group_location
}