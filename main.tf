module "scaffold" {
  source    = "../terraform-module-scaffold/"
}

resource "azurerm_resource_group" "webapps" {
    name        = "webapps"
    location    = "westeurope"
}
resource "random_string" "webapprnd" {
  length  = 8
  lower   = true
  number  = true
  upper   = false
  special = false
}

resource "azurerm_app_service_plan" "free" {
    count               = length(var.webapplocs)
    name                = "plan-free-${random_string.webapprnd.result}-${var.webapplocs[count.index]}"
    location            = var.webapplocs[count.index]
    resource_group_name = element(azurerm_resource_group.webapps.*.name, count.index)
    tags                = element(azurerm_resource_group.webapps.*.tags, count.index)

    kind                = "Linux"
    reserved            = true
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "citadel" {
    count               = length(var.webapplocs)
    name                = "webapp-${random_string.webapprnd.result}-${var.webapplocs[count.index]}"
    location            = var.webapplocs[count.index]
    resource_group_name = element(azurerm_resource_group.webapps.*.name, count.index)
    tags                = element(azurerm_resource_group.webapps.*.tags, count.index)

    app_service_plan_id = element(azurerm_app_service_plan.free.*.id, count.index)
}

output "webapp_ids" {
    description = "The IDs of each webapp provisioned"
    value       = azurerm_app_service_plan.free.*.id
}