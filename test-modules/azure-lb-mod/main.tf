resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  # edge_zone         = var.edge_zone
  ip_version          = var.pip_ip_version
  sku                 = var.pip_sku
  sku_tier            = var.pip_sku_tier
  zones               = var.pip_zones
  tags                = var.tags
}

resource "azurerm_lb" "azure_lb" {
  name                = var.azure_lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  # edge_zone           = var.edge_zone
  sku                 = var.lb_sku
  sku_tier            = var.lb_sku_tier
  tags                = var.tags

  frontend_ip_configuration {
    name                 = var.front_ip_config_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_addr_pool" {
  loadbalancer_id = azurerm_lb.azure_lb.id
  name            = var.backend_pool_name
}

resource "azurerm_lb_nat_rule" "nat_rule_azlb" {
  count = length(var.remote_port)
  backend_port                   = element(var.remote_port[element(keys(var.remote_port), count.index)], 1)
  frontend_ip_configuration_name = var.front_ip_config_name
  loadbalancer_id                = azurerm_lb.azure_lb.id
  name                           = "VM-${count.index}"
  protocol                       = "Tcp"
  resource_group_name            = var.resource_group_name
  frontend_port                  = "5000${count.index + 1}"
}

resource "azurerm_lb_probe" "lb_probe_azlb" {
  count = length(var.lb_probe)
  loadbalancer_id     = azurerm_lb.azure_lb.id
  name                = element(keys(var.lb_probe), count.index)
  port                = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 1)
  interval_in_seconds = var.lb_probe_interval
  number_of_probes    = var.lb_probe_unhealthy_threshold
  protocol            = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 0)
  request_path        = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 2)
}

resource "azurerm_lb_rule" "lb_rule_azlb" {
  count = length(var.lb_port)
  backend_port                   = element(var.lb_port[element(keys(var.lb_port), count.index)], 2)
  frontend_ip_configuration_name = var.front_ip_config_name
  frontend_port                  = element(var.lb_port[element(keys(var.lb_port), count.index)], 0)
  loadbalancer_id                = azurerm_lb.azure_lb.id
  name                           = element(keys(var.lb_port), count.index)
  protocol                       = element(var.lb_port[element(keys(var.lb_port), count.index)], 1)
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_addr_pool.id]
  probe_id                       = element(azurerm_lb_probe.lb_probe_azlb[*].id, count.index)
}