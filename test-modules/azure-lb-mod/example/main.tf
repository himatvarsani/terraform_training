provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "load_balancer_rg" {
  name     = var.resource_group_name
  location = var.location
}

# resource "azurerm_public_ip" "public_ip" {
#   name                = var.public_ip_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = var.allocation_method
# }


module "azure_lb" {
  source                  = "../"
  location                = var.location
  resource_group_name     = azurerm_resource_group.load_balancer_rg.name
  allocation_method       = var.allocation_method
  azure_lb_name           = var.azure_lb_name
  front_ip_config_name    = var.front_ip_config_name
  public_ip_name          = var.public_ip_name
  pip_ip_version          = var.pip_ip_version
  pip_sku                 = var.pip_sku
  pip_sku_tier            = var.pip_sku_tier
  pip_zones               = var.pip_zones
  tags                    = var.tags
  lb_sku                  = var.lb_sku
  lb_sku_tier             = var.lb_sku_tier
  # public_ip_address_id  = azurerm_public_ip.public_ip.id
  backend_pool_name       = var.backend_pool_name
  remote_port             = var.remote_port
  lb_port                 = var.lb_port
  lb_probe                = var.lb_probe 
  lb_probe_interval       = var.lb_probe_interval
  lb_probe_unhealthy_threshold = var.lb_probe_unhealthy_threshold
}


