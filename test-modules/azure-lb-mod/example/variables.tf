variable "location" {
  type        = string
  description = "Location"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public IP"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "allocation_method" {
  type        = string
  description = "allocation method"
  default     = "Static"
}

variable "azure_lb_name" {
  type        = string
  description = "name of the LB"
}

variable "front_ip_config_name" {
  type        = string
  description = "frontend ip configuration name"
}

# variable "edge_zone" {
#   type        = string
#   description = "(Optional) Specifies the Edge Zone within the Azure Region where this Public IP and Load Balancer should exist. Changing this forces new resources to be created."
#   default     = null
# }

variable "lb_sku" {
  description = "(Optional) The SKU of the Azure Load Balancer. Accepted values are Basic and Standard."
  type        = string
  default     = "Basic"
}

variable "pip_sku" {
  description = "(Optional) The SKU of the Azure Public IP. Accepted values are Basic and Standard."
  type        = string
  default     = "Basic"
}

variable "pip_sku_tier" {
  type        = string
  description = "(Optional) The SKU Tier that should be used for the Public IP. Possible values are `Regional` and `Global`. Defaults to `Regional`. Changing this forces a new resource to be created."
  default     = "Regional"
}

variable "pip_ip_version" {
  type        = string
  description = "(Optional) The IP Version to use, `IPv6` or `IPv4`. Defaults to `IPv4`. Changing this forces a new resource to be created. Only `static` IP address allocation is supported for `IPv6`."
  default     = "IPv4"
}

variable "pip_zones" {
  type        = list(string)
  description = "(Optional) A collection containing the availability zone to allocate the Public IP in. Changing this forces a new resource to be created. Availability Zones are only supported with a [Standard SKU](https://docs.microsoft.com/azure/virtual-network/virtual-network-ip-addresses-overview-arm#standard) and [in select regions](https://docs.microsoft.com/azure/availability-zones/az-overview) at this time. Standard SKU Public IP Addresses that do not specify a zone are **not** zone-redundant by default."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default = {
    source = "terraform"
  }
}

variable "lb_sku_tier" {
  description = "(Optional) The SKU tier of this Load Balancer. Possible values are `Global` and `Regional`. Defaults to `Regional`. Changing this forces a new resource to be created."
  type        = string
  default     = "Regional"
}

variable "backend_pool_name" {
  type        = string
  description = "name of the LB"
}

variable "remote_port" {
  description = "Protocols to be used for remote vm access. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output."
  type        = map(any)
  default     = {}
}

variable "lb_port" {
  description = "Protocols to be used for lb rules. Format as [frontend_port, protocol, backend_port]"
  type        = map(any)
  default     = {}
}

variable "lb_probe" {
  description = "(Optional) Protocols to be used for lb health probes. Format as [protocol, port, request_path]"
  type        = map(any)
  default     = {}
}

variable "lb_probe_interval" {
  description = "Interval in seconds the load balancer health probe rule does a check"
  type        = number
  default     = 5
}

variable "lb_probe_unhealthy_threshold" {
  description = "Number of times the load balancer health probe has an unsuccessful attempt before considering the endpoint unhealthy."
  type        = number
  default     = 2
}