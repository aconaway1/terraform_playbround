resource "azurerm_virtual_wan" "vwan00" {
  name                = "VWAN00"
  resource_group_name = azurerm_resource_group.rg00.name
  location            = azurerm_resource_group.rg00.location
}


resource "azurerm_virtual_hub" "vhub00" {
  name                = "VHUB00"
  resource_group_name = azurerm_resource_group.rg00.name
  location            = azurerm_resource_group.rg00.location
  virtual_wan_id      = azurerm_virtual_wan.vwan00.id
  address_prefix      = "10.255.1.0/24"
}


resource "azurerm_virtual_hub_connection" "vwan00-VNET27" {
  name = "VWAN00-VNET27"

  virtual_hub_id            = azurerm_virtual_hub.vhub00.id
  remote_virtual_network_id = azurerm_virtual_network.vnet27.id
}

resource "azurerm_virtual_hub_connection" "vwan00-VNET28" {
  name = "VWAN00-VNET28"

  virtual_hub_id            = azurerm_virtual_hub.vhub00.id
  remote_virtual_network_id = azurerm_virtual_network.vnet28.id
}