
provider "azurerm" {
    version = "~> 1.23"
    use_msi = true
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
    client_id = var.client_id
    client_secret = var.client_secret
}

module "my_app_service" {
  source = "app.terraform.io/Sage-PLC/app-service/azurerm"
  resource_group_name = var.resource_group_name
  location = var.location
  os_type = var.os_type
  web_app_name = var.web_app_name
  app_service_plan_name = var.app_service_plan
  app_settings = var.app_settings
  #tier = var.sku_tier
  #size = var.sku_size
  sku_name = var.sku_name
  always_on = var.site_config.always_on
  http2_enabled = var.site_config.http2_enabled
  load_balancing_mode = var.site_config.load_balancing_mode
  managed_pipeline_mode = var.site_config.managed_pipeline_mode
  minimum_tls_version = var.site_config.minimum_tls_version
  remote_debugging_enabled = var.site_config.remote_debugging_enabled
  scm_minimum_tls_version = var.site_config.scm_minimum_tls_version
  scm_use_main_ip_restriction = var.site_config.scm_use_main_ip_restriction
  vnet_route_all_enabled = var.site_config.vnet_route_all_enabled
  websockets_enabled = var.site_config.websockets_enabled
  public_network_access_enabled = var.public_network_access_enabled
 }
