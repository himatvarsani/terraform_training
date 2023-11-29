variable "resource_group_name" {
  type            = string
  description     = "The name of an existing resource group to be imported."
  
}

variable "location" {
  type        = string
  description = "Resources location"
}

variable "function_app_name" {
  type        = string
  description = "Application insights name"
}

variable "create_resource_group" {
  type = bool
  default = false
  description = "The option to create a resource group if it doesn't exist"
}

# variable "create_storage_account" {
#   type = bool
#   default = false
#   description = "The option to create a storage account if it doesn't exist"
# }

variable "service_plan_name" {
  type = string
  description = ""
}

variable "service_plan_id" {
  type = string
  description = ""
  default = "default-example-id"
}

variable "sku_name" {
  type = string
  default = "S1"
  description = ""
}

variable "storage_account_name" {
  type        = string
  description = "The name which should be used for the storage account name."
}

variable "https_only" {
  default     = true
  type        = bool
  description = "Whether HTTPS traffic only is enabled."
}

variable "os_type" {
  default     = "Linux"
  type        = string
  description = "Defines the os type for the function app. Valid options are `Linux` and `Windows`."
  validation {
    condition     = can(regex("^(Linux|Windows)$", var.os_type))
    error_message = "Valid options are `Linux` and `Windows`."
  }
}

variable "tags" {
  default = {}
  type        = map(string)
  description = "Tags for resources {key:value}"
}

variable "identity" {
  description = "(Optional) Identity configuration for the function app, i.e. if the identity is system assigned and/or user assigned."
  type = object({
    type         = string
    identity_ids = list(string)
  })
  default = null
}

variable "functions_worker_runtime" {
  default     = "dotnet"
  type = string
  description = "The language worker runtime to load into the function app.  Valid values are 'dotnet','node','java','powershell', 'python'.  The default value is 'dotnet'."

    validation {
    condition = contains([
      "dotnet",
      "node",
      "java",
      "python",
      "powershell"
    ], var.functions_worker_runtime)
    error_message = "Valid options are `dotnet`, `node`, `java`, `python` or `powershell`."
  }
}

# variable "runtime" {
#   type = object({
#     dotnet_version = string,
#     java_version   = string,
#     node_version   = string,
#     python_version = string,
#     powershell_core_version = string,
#     # use_custom_runtime      = string,
#   })
#    validation {
#     condition     = var.runtime.dotnet_version != null || var.runtime.java_version != null || var.runtime.node_version != null || var.runtime.python_version != null || var.runtime.powershell_core_version != null
#     error_message = "One and only one of runtime versions must be set."
#   }
# }

variable "website_run_from_package" {
  default     = "0"
  type        = string
  description = "This enables your function app to run from a mounted package file.  See documentation for instructions"
}

variable "always_on" {
  default     = true
  type        = bool
  description = "(Optional) Whether or not this function app continue running when idle. Defaults to true."
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