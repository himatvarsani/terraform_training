resource "azurerm_resource_group" "azure_rg" {
    name     = "${var.resource_group}_rg"
    location = var.location
}

resource "azurerm_virtual_network" "azure_vnet" {
    name                = var.vnet_name
    location            = azurerm_resource_group.azure_rg.location
    resource_group_name = azurerm_resource_group.azure_rg.name
    address_space       = [var.address_space]
}

resource "azurerm_subnet" "subnet" {
    count                   = var.create_subnet == false ? 0 : length(var.subnet_name)
    name                    = var.subnet_name[count.index]
    virtual_network_name    = azurerm_virtual_network.azure_vnet.name
    resource_group_name     = azurerm_resource_group.azure_rg.name
    address_prefixes        = [var.subnet_prefix[count.index]]
}