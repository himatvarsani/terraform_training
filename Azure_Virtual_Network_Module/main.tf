provider "azurerm" {
  features {

  }
}

module "module_vnet" {
  source              = "./module"
  resource_group      = var.resource_group
  vnet_name           = var.vnet_name
  location            = var.location
  create_subnet       = var.create_subnet
  subnet_name         = var.subnet_name
}


# Testing the Data Block - Manually created in the Portal in this example.
# data "azurerm_virtual_machine" "example" {
#   name                = "HMTestVM01"
#   resource_group_name = "hm_test_rg_data"
# }

# output "virtual_machine_id" {
#   value = data.azurerm_virtual_machine.example.id
# }

# data "azurerm_virtual_network" "example" {
#   name                = "hm_vm_data_test"
#   resource_group_name = "hm_test_rg_data"
# }

# output "vnet_outputs" {
#   value       = {
#     vnet_id           = data.azurerm_virtual_network.example.id
#     vnet_location     = data.azurerm_virtual_network.example.location
#     vnet_address      = data.azurerm_virtual_network.example.address_space
#     vnet_tags         = data.azurerm_virtual_network.example.tags
#   }
#   description = "Virtual Network"
# }



# resource "azurerm_virtual_network" "azure_vnet" {
#     name                = "test_vnet"
#     location            = data.azurerm_resource_group.rg_existing.location
#     resource_group_name = data.azurerm_resource_group.rg_existing.name
#     address_space       = ["10.0.15.0/24"]
# }