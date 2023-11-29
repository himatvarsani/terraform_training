variable "resource_group_name" {
    description     = "The name of an existing resource group to be imported."
    type            = string
}

variable "resource_group_location" {
    description     = "The location/region where the resource group is to be located."
    type            = string
    default         = null
}

variable "storage_account_name" {
    description = "The name which should be used for the storage account name."
    type        = string
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
  validation {
    condition     = can(regex("^(Standard|Premium)$", var.account_tier))
    error_message = "Valid options are `Standard` and `Premium`."
  }
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` or `RAGZRS`. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  type        = string
  default = "LRS"
  validation {
    condition = contains([
      "LRS",
      "GRS",
      "RAGRS",
      "ZRS",
      "GZRS",
      "RAGZRS"
    ], var.account_replication_type)
    error_message = "Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` or `RAGZRS`."
  }
}

variable "application_insight_name" {
  description = "The name which should be used for the application insight name."
  type        = string
}

variable "service_plan_name" {
  description = "The name which should be used for the service plan name."
  type        = string
}

variable "function_app_name" {
  description = "The name which should be used for the function app name."
  type        = string
}

variable "https_only" {
  description = "Whether HTTPS traffic only is enabled."
  type        = bool
  default     = true
}

variable "function_app_version" {
  description = "Version of the function app runtime to use."
  type        = number
  default     = 3
}


variable "os_type" {
  description = "Defines the os type for the function app. Valid options are `Linux` and `Windows`."
  type        = string
  default     = "Linux"
  validation {
    condition     = can(regex("^(Linux|Windows)$", var.os_type))
    error_message = "Valid options are `Linux` and `Windows`."
  }
}