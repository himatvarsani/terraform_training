terraform {
    required_version = ">= 1.3"
    
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "3.40"
        }
    }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy               = false
      purge_soft_deleted_certificates_on_destroy = false
      purge_soft_deleted_keys_on_destroy         = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  use_oidc = true
}