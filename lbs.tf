resource "azurerm_public_ip" "lb-27-00-pub" {
  name = "LB-27-00-PUB"

  location = azurerm_resource_group.rg00.location
  resource_group_name = azurerm_resource_group.rg00.name

  sku = "Standard"

  allocation_method = "Static"

  domain_name_label = "aaron-27-00"
}

resource "azurerm_lb" "lb-27-00" {
  name = "LB-27-00"
  location = azurerm_resource_group.rg00.location
  resource_group_name = azurerm_resource_group.rg00.name

  sku = "Standard"

  frontend_ip_configuration {
    name = "LB-27-00-FE"
    public_ip_address_id = azurerm_public_ip.lb-27-00-pub.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb-27-00-pool" {
  name = "LB-27-00-POOL"
  loadbalancer_id = azurerm_lb.lb-27-00.id
}

resource "azurerm_lb_rule" "lb-27-00-rule-00" {
  name = "LB-27-00-RULE-00"

  protocol = "Tcp"
  frontend_port = 22
  backend_port = 22
  frontend_ip_configuration_name = azurerm_lb.lb-27-00.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb-27-00-pool.id]
  loadbalancer_id = azurerm_lb.lb-27-00.id
  enable_tcp_reset = "true"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb-27-00-vm-27-00" {
  network_interface_id = azurerm_network_interface.vm-27-00-if.id
  ip_configuration_name = azurerm_network_interface.vm-27-00-if.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-27-00-pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "lb-27-00-vm-27-01" {
  network_interface_id = azurerm_network_interface.vm-27-01-if.id
  ip_configuration_name = azurerm_network_interface.vm-27-01-if.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-27-00-pool.id
}



resource "azurerm_network_security_group" "nsg-lb-27-00" {
  name = "NSG-LB-27-00"

  location = azurerm_resource_group.rg00.location
  resource_group_name = azurerm_resource_group.rg00.name
}

resource "azurerm_network_security_rule" "nsr-lb-27-00" {
  name = "NSR-LB-27-00"

  resource_group_name = azurerm_resource_group.rg00.name

  network_security_group_name = azurerm_network_security_group.nsg-lb-27-00.name

  priority = 100
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_interface_security_group_association" "nsg-vm-27-00" {
  network_interface_id = azurerm_network_interface.vm-27-00-if.id
  network_security_group_id = azurerm_network_security_group.nsg-lb-27-00.id
}

resource "azurerm_network_interface_security_group_association" "nsg-vm-27-01" {
  network_interface_id = azurerm_network_interface.vm-27-01-if.id
  network_security_group_id = azurerm_network_security_group.nsg-lb-27-00.id
}
