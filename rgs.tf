resource "azurerm_resource_group" "rg17" {
  name = var.RG17
  location = var.LOCATION
}

resource "azurerm_resource_group" "rg18" {
  name = var.RG18
  location = var.LOCATION
}

resource "azurerm_resource_group" "rfinfra" {
  name = var.RGINFRA
  location = var.LOCATION
}