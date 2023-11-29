# ul-azure-functions-tf-module
Kwery Azure Functions terraform module

## Create a function app in Azure

Azure Functions is a cloud service available on-demand that provides infrastructure and resources needed to run you applications.  
<br> Functions provides serverless compute for Azure. You can use Functions to build web APIs, respond to database changes, process IoT streams, manage message queues, and more.

## Limitations

Based on a current limitation, you cannot mix Windows and Linux apps in the same resource group.

Limitations documentation: [docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-intro#limitations](https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-intro#limitations)

## Usage in Terraform 0.13
```hcl
# Resource Group
resource "azurerm_resource_group" "function_app_rg" {
  name     = "${var.resource_group_name}_rg"
  location = var.location
}

# Service plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.function_app_rg.name
  location            = azurerm_resource_group.function_app_rg.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

# Storage Account
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.function_app_rg.name
  location                 = azurerm_resource_group.function_app_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

# Function App Module
module "function_app" {
  source                      = "../"
  function_app_name           = var.function_app_name
  location                    = var.location
  resource_group_name         = azurerm_resource_group.function_app_rg.name
  service_plan_id             = azurerm_service_plan.app_service_plan.id
  storage_account_name        = azurerm_storage_account.storage_account.name
  os_type                     = var.os_type 
  tags                        = var.tags

  depends_on = [
    azurerm_service_plan.app_service_plan
  ]
}
```
## Configurations

- [Configure Terraform for Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure)

We assumed that you have setup service principal's credentials in your environment variables like below:

```shell
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"
```

On Windows Powershell:

```shell
$env:ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
$env:ARM_TENANT_ID="<azure_subscription_tenant_id>"
$env:ARM_CLIENT_ID="<service_principal_appid>"
$env:ARM_CLIENT_SECRET="<service_principal_password>"
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.40 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_function_app.function_app](https://registry.terraform.io/providers/hashicorp/azurerm/3.40/docs/resources/linux_function_app) | resource |
| [azurerm_windows_function_app.function_app](https://registry.terraform.io/providers/hashicorp/azurerm/3.40/docs/resources/windows_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Defines the type of replication to use for this storage account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` or `RAGZRS`. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa. | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Defines the Tier to use for this storage account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_always_on"></a> [always\_on](#input\_always\_on) | (Optional) Whether or not this function app continue running when idle. Defaults to true. | `bool` | `true` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | The option to create a resource group if it doesn't exist | `bool` | `false` | no |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | Application insights name | `string` | n/a | yes |
| <a name="input_functions_worker_runtime"></a> [functions\_worker\_runtime](#input\_functions\_worker\_runtime) | The language worker runtime to load into the function app.  Valid values are 'dotnet','node','java','powershell', 'python'.  The default value is 'dotnet'. | `string` | `"dotnet"` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Whether HTTPS traffic only is enabled. | `bool` | `true` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) Identity configuration for the function app, i.e. if the identity is system assigned and/or user assigned. | <pre>object({<br>    type         = string<br>    identity_ids = list(string)<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Resources location | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Defines the os type for the function app. Valid options are `Linux` and `Windows`. | `string` | `"Linux"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of an existing resource group to be imported. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | Service plan id | `string` | `"default-id"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | sku name | `string` | `"S1"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name which should be used for the storage account name. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for resources {key:value} | `map(string)` | `{}` | no |
| <a name="input_website_run_from_package"></a> [website\_run\_from\_package](#input\_website\_run\_from\_package) | This enables your function app to run from a mounted package file.  See documentation for instructions | `string` | `"0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_app_name"></a> [function\_app\_name](#output\_function\_app\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
