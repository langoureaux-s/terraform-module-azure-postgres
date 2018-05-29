variable "location" {
    description = "The Azure Region in which the Resource Group exists"
}

variable "rg_name" {
    description = "The name of the Resource Group where VM resources will be created"
}

variable "name" {
    description = "Postgres server name"
}

variable "sku" {
    type = "map"
    description = "The Postgres SKU"
    default = {
        name = "B_Gen5_1"
        capacity = 1
        tier = "Basic"
        family = "Gen5"
    }
}

variable "storage_mb" {
    description = "The server storage in MB"
    default = 5120
}

variable "backup_retention_days" {
    description = "The backup retention in days"
    default = 7
}

variable "admin_username" {
    description = "The admin username"
}

variable "admin_password" {
    description = "The admin password"
}

variable "version" {
    description = "The postgres version"
    default = "9.6"
}

variable "databases" {
    type = "list"
    description = "The list of databases hosted on Postgres server"
}

variables "security_rules" {
    type = "list"
    description = "The security rules to create on Postgres"
    default = {
        name        = "all"
        start_ip    = "0.0.0.0"
        end_ip      = "255.255.255.0"
    }
}

variable "tags" {
    description = "List of tags should be associated on all ressoruces"
    type = "map"
    default = {
        module = "module-azure-security"
    }
}