resource "azurerm_virtual_network" "vnet27" {
  name = "VNET27"

  resource_group_name = azurerm_resource_group.rg00.name
  location = azurerm_resource_group.rg00.location

  address_space = ["172.27.0.0/16"]

}

resource "azurerm_subnet" "sub_172-27-0-0_24" {
  name = "SUB_172-27-0-0_24"
  virtual_network_name = azurerm_virtual_network.vnet27.name
  resource_group_name = azurerm_resource_group.rg00.name

  address_prefixes = ["172.27.0.0/24"]
}

resource "azurerm_subnet" "sub_172-27-1-0_24" {
  name = "SUB_172-27-1-0_24"
  virtual_network_name = azurerm_virtual_network.vnet27.name
  resource_group_name = azurerm_resource_group.rg00.name
  
  address_prefixes = ["172.27.1.0/24"]
}






resource "azurerm_virtual_network" "vnet28" {
  name = "VNET28"

  resource_group_name = azurerm_resource_group.rg00.name
  location = azurerm_resource_group.rg00.location

  address_space = ["172.28.0.0/16"]

}

resource "azurerm_subnet" "sub_172-28-0-0_24" {
  name = "SUB_172-28-0-0_24"
  virtual_network_name = azurerm_virtual_network.vnet28.name
  resource_group_name = azurerm_resource_group.rg00.name

  address_prefixes = ["172.28.0.0/24"]
}

resource "azurerm_subnet" "sub_172-28-1-0_24" {
  name = "SUB_172-28-1-0_24"
  virtual_network_name = azurerm_virtual_network.vnet28.name
  resource_group_name = azurerm_resource_group.rg00.name
  
  address_prefixes = ["172.28.1.0/24"]
}
