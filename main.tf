
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  
}

resource "azurerm_service_plan" "service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name

}

resource "azurerm_linux_web_app" "web_App" {
  count                         = var.os_type == "Linux" ? 1 : 0
  name                          = var.web_app_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  service_plan_id               = azurerm_service_plan.service_plan.id
  public_network_access_enabled = var.public_network_access_enabled
  app_settings                  = var.app_settings

  site_config {
    always_on                   = var.site_config.always_on
    http2_enabled               = var.site_config.http2_enabled
    load_balancing_mode         = var.site_config.load_balancing_mode
    managed_pipeline_mode       = var.site_config.managed_pipeline_mode
    minimum_tls_version         = var.site_config.minimum_tls_version
    remote_debugging_enabled    = var.site_config.remote_debugging_enabled
    scm_minimum_tls_version     = var.site_config.scm_minimum_tls_version
    scm_use_main_ip_restriction = var.site_config.scm_use_main_ip_restriction
    vnet_route_all_enabled      = var.site_config.vnet_route_all_enabled
    websockets_enabled          = var.site_config.websockets_enabled

  }
}

resource "azurerm_windows_web_app" "web_App" {
  count                         = var.os_type == "Windows" ? 1 : 0
  name                          = var.web_app_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  service_plan_id               = azurerm_service_plan.service_plan.id
  public_network_access_enabled = var.public_network_access_enabled
  app_settings                  = var.app_settings

  site_config {
    always_on                   = var.site_config.always_on
    http2_enabled               = var.site_config.http2_enabled
    load_balancing_mode         = var.site_config.load_balancing_mode
    managed_pipeline_mode       = var.site_config.managed_pipeline_mode
    minimum_tls_version         = var.site_config.minimum_tls_version
    remote_debugging_enabled    = var.site_config.remote_debugging_enabled
    scm_minimum_tls_version     = var.site_config.scm_minimum_tls_version
    scm_use_main_ip_restriction = var.site_config.scm_use_main_ip_restriction
    vnet_route_all_enabled      = var.site_config.vnet_route_all_enabled
    websockets_enabled          = var.site_config.websockets_enabled
}
}
