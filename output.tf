
output "app_service_url" {
  description = "The URL of the deployed App Service."
  value       = azurerm_app_service.as.default_site_hostname
}
