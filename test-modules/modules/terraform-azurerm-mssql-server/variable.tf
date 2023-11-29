variable "random_password_length" {
    type            = number
    description     = "The desired length of random password created by this module"
    default         = 16
}

variable "special" {
    type            = bool
    description     = "The desired length of random password created by this module"  
    default         = true
}

variable "override_special" {
    type            = string    
    description     = "special characters for password as special is equal to true"
    default         = "!#$%&*()-_=+[]{}<>:?"
}

variable "sql_server__name" {
    type            = string
    description     = "The name of an existing resource group to be imported."
}

variable "resource_group_name" {
    type            = string
    description     = "The name of an existing resource group to be imported."
}

variable "location" {
    type            = string
    description     = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "version" {
    type            = string
    description     = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)'"
}

variable "administrator_login" {
    type            = string
    description     = "The administrator login name for the new server. When omitted, Azure will generate a default username which cannot be subsequently changed. Changing this forces a new resource to be created.'"
}

variable "tls_version" {
    type            = string
    description     = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 , 1.2 and Disabled. Defaults to 1.2.'"
    default         = "1.2"
}

variable "public_network_access_enabled" {
    type            = bool
    description     = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 , 1.2 and Disabled. Defaults to 1.2.'"
    default         = false
}

variable "login_username" {
    type            = string
    description     = "The login username of the Azure AD Administrator of this SQL Server."
}

variable "admin_password" {
  description = "The password associated with the admin_username user"
  default     = null
}

variable "object_id" {
    type            = string
    description     = "The login username of the Azure AD Administrator of this SQL Server."
}

variable "tags" {
    type            = map(string)
    description     = "Tags for resources {key:value}"
    default         = {}
}

variable "enable_failover_group" {
    type            = bool          
    description     = "Create a failover group of databases on a collection of Azure SQL servers"
    default         = false
}

variable "secondary_location" {
    type            = string
    description     = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}