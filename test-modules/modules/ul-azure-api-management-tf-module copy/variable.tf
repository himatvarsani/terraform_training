##### API MANAGEMENT SERVICE

variable "apim_name" {
  description = "The name of the API Management Service"
  type        = string
}

variable "location" {
  description = "The Azure location where the API Management Service exists"
  type        = string
}

variable "rgroup_name" {
  description = "The name of the Resource Group in which the API Management Service should be exist"
  type        = string
}

variable "publisher_name" {
  description = "The name of the Resource Group in which the API Management Service should be exist"
  type        = string
}

variable "publisher_email" {
  description = "The name of the Resource Group in which the API Management Service should be exist"
  type        = string
}

variable "sku_name" {
  description = "sku_name is a string consisting of two parts separated by an underscore(_). The first part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  type        = string
  default     = "Developer"
  validation {
    condition = (
      var.sku_name == "Developer" || var.sku_name == "Consumption" || var.sku_name == "Basic" || var.sku_name == "Standard" || var.sku_name == "Premium"
    )
    error_message = "The first part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium."
  }
}

variable "sku_capacity" {
  description = "(Required) sku_name is a string consisting of two parts separated by an underscore(_). The first part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  type        = number
  default     = 1
  validation {
    condition = (
      var.sku_capacity >= 1 && var.sku_capacity < 13
    )
    error_message = "The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  }
}

variable "tags" {
  description = "A map of the tags to use on the resources that are deployed with this module."
  type        = map(string)

  default = {
    source = "terraform"
  }
}



##### API MANAGEMENT API

variable "apis" {
  description = "APIs and Operation maps"
  type = map(object({
    api_name         = string
    api_display_name = string
    revision         = number
    path             = string
    protocols        = list(string)
    service_url      = string
    subscription     = bool
    # operations = map(object({
    #   operation_name         = string
    #   operation_display_name = string
    #   method                 = string
    #   url_template           = string
    #   description            = string
    # }))
  }))

  default = {}
}

variable "content_format" {
  description = "The format of the content from which the API Definition should be imported."
  type        = string
}

variable "content_value" {
  description = "The Content from which the API Definition should be imported. "
  type        = string
}
