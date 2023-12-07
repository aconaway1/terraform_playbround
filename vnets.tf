#####
#
#  VNET17
#
#####
resource "azurerm_virtual_network" "vnetinfra" {
  name = "VNETINFRA"
  location = var.LOCATION
  resource_group_name = var.RGINFRA
  
  address_space = [ "10.255.0.0/16" ]
}

resource "azurerm_subnet" "subnet-10-255-0-0_24" {
  name = "SUBNET-10-255-0-0_24"
  resource_group_name = var.RGINFRA
  virtual_network_name = azurerm_virtual_network.vnetinfra.name
  address_prefixes = [ "10.255.0.0/24" ]
}

resource "azurerm_subnet" "subnet-10-255-1-0_24" {
  name = "SUBNET-10-255-1-0_24"
  resource_group_name = var.RGINFRA
  virtual_network_name = azurerm_virtual_network.vnetinfra.name
  address_prefixes = [ "10.255.1.0/24" ]
}



#####
#
#  VNET17
#
#####
resource "azurerm_virtual_network" "vnet17" {
  name = "VNET17"
  location = var.LOCATION
  resource_group_name = var.RG17
  
  address_space = [ "172.17.0.0/16" ]
}

resource "azurerm_subnet" "subnet-172-17-0-0_24" {
  name = "SUBNET-172-17-0-0_24"
  resource_group_name = var.RG17
  virtual_network_name = azurerm_virtual_network.vnet17.name
  address_prefixes = [ "172.17.0.0/24" ]
}

resource "azurerm_subnet" "subnet-172-17-1-0_24" {
  name = "SUBNET-172-17-1-0_24"
  resource_group_name = var.RG17
  virtual_network_name = azurerm_virtual_network.vnet17.name
  address_prefixes = [ "172.17.1.0/24" ]
}




#####
#
#  VNET18
#
#####
resource "azurerm_virtual_network" "vnet18" {
  name = "VNET18"
  location = var.LOCATION
  resource_group_name = var.RG18
  
  address_space = [ "172.18.0.0/16" ]
}

resource "azurerm_subnet" "subnet-172-18-0-0_24" {
  name = "SUBNET-172-18-0-0_24"
  resource_group_name = var.RG18
  virtual_network_name = azurerm_virtual_network.vnet18.name
  address_prefixes = [ "172.18.0.0/24" ]
}

resource "azurerm_subnet" "subnet-172-18-1-0_24" {
  name = "SUBNET-172-18-1-0_24"
  resource_group_name = var.RG18
  virtual_network_name = azurerm_virtual_network.vnet18.name
  address_prefixes = [ "172.18.1.0/24" ]
}