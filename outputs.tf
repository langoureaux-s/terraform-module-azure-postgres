output "postgresql_server_id" {
  value = "${azurerm_postgresql_server.server.id}"
}

output "postgresql_server_fqdn" {
  value = "${azurerm_postgresql_server.server.fqdn}"
}