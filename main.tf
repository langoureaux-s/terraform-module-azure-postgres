resource "azurerm_postgresql_server" "server" {
  name                          = "postgresql-${var.name}"
  location                      = "${var.location}"
  resource_group_name           = "${var.rg_name}"

  sku {
    name                        = "${lookup(var.sku, "name")}"
    capacity                    = "${lookup(var.sku, "capacity")}"
    tier                        = "${lookup(var.sku, "tier")}"
    family                      = "${lookup(var.sku, "family")}"
  }


  storage_profile {
    storage_mb                  = "${var.storage_mb}"
    backup_retention_days       = "${var.backup_retention_days}"
    geo_redundant_backup        = "Disabled"
  }

  administrator_login           = "${var.admin_username}"
  administrator_login_password  = "${var.admin_password}"
  version                       = "${var.version}"
#  storage_mb                    = "${var.storage_mb}"
  ssl_enforcement               = "Disabled"
  
  tags                          = "${var.tags}"
}

resource "azurerm_postgresql_database" "db" {
  count                 = "${length(var.databases)}"
  name                  = "${lookup(var.databases[count.index], "name")}"
  resource_group_name   = "${var.rg_name}"
  server_name           = "${azurerm_postgresql_server.server.name}"
  charset               = "${lookup(var.databases[count.index], "charset", "UTF8")}"
  collation             = "${lookup(var.databases[count.index], "collation", "en_US")}"
}