variable subscription_id {
    type = string
    description = "Azure Subscription Id"
}

variable tenant_id {
    type = string
    description = "Azure Tenant Id"
}

variable client_id {
    type = string
    description = "Client Id"
}

variable client_secret {
    type = string
    description = "Client Secret"
}

variable "resource_group_name" {
type = string
description = "The name of the Azure Resource Group where the resources will be created."
}

variable "location" {
type = string
description = "The Azure region where the resources will be deployed. E.g., 'East US', 'West Europe', etc."
}

variable "os_type" {
type = string
description = "Operating System Type"
default = " "
}

variable "web_app_name" {
  type    = string
  default = "app_service_test_web_app"
}

variable "app_service_plan" {
type = string
description = "Azure app_service_plan"
}

#variable "sku_tier" {
#type = string
#description = "Azure app service sku_tier"
#}

#variable "sku_size" {
#type = string
#description = " Azure App service size"
#}

variable "sku_name" {
  type    = string
  default = ""
}

variable "app_settings" {
  description = "A key-value pair of App Settings."
  type        = map(string)
  default     = {}
}

variable "public_network_access_enabled" {
  type    = bool
  default = {}
}

variable "site_config" {
  description = "site settings for App service"
  type = object({
    always_on                   = bool
    http2_enabled               = bool
    load_balancing_mode         = string
    managed_pipeline_mode       = string
    minimum_tls_version         = string
    remote_debugging_enabled    = bool
    scm_minimum_tls_version     = string
    scm_use_main_ip_restriction = bool
    vnet_route_all_enabled      = bool
    websockets_enabled          = optional(bool)
  })

  default = {
    always_on                   = true
    http2_enabled               = false
    load_balancing_mode         = "LeastRequests"
    managed_pipeline_mode       = "Integrated"
    minimum_tls_version         = "1.2"
    remote_debugging_enabled    = false
    scm_minimum_tls_version     = "1.2"
    scm_use_main_ip_restriction = false
    vnet_route_all_enabled      = false
    websockets_enabled          = false
  }
}
