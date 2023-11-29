# Random number generating for password
resource "random_password" "password" {
  length           = var.random_password_length
  special          = var.special
  override_special = var.override_special
}

resource "azurerm_mssql_server" "primary_mssql_server" {
  name                          = format("%s-primary", var.sql_server__name)
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.version
  administrator_login           = var.administrator_login == null ? "sqladmin" : var.administrator_login #var.administrator_login
  administrator_login_password  = var.admin_password == null ? random_password.password.result : var.admin_password #random_password.password.result
  minimum_tls_version           = var.tls_version
  public_network_access_enabled = var.public_network_access_enabled

  # Azure AD administration
  azuread_administrator {
    login_username              = var.login_username
    object_id                   = var.object_id
  }

  tags                          = merge({ "Name" = format("%s-primary", var.sql_server__name) }, var.tags, )
}

resource "azurerm_sql_server" "secondary" {
  count                        = var.enable_failover_group ? 1 : 0
  name                         = format("%s-secondary", var.sql_server__name)
  resource_group_name          = var.resource_group_name
  location                     = var.secondary_location
  version                      = var.version
  administrator_login          = var.administrator_login == null ? "sqladmin" : var.administrator_login
  administrator_login_password = var.admin_password == null ? random_password.password.result : var.admin_password
  minimum_tls_version           = var.tls_version
  public_network_access_enabled = var.public_network_access_enabled

  # Azure AD administration
  azuread_administrator {
    login_username              = var.login_username
    object_id                   = var.object_id
  }

  tags                         = merge({ "Name" = format("%s-secondary", var.sql_server__name) }, var.tags, )

  
}
