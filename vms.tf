resource "azurerm_network_interface" "vm-27-00-if" {
    name = "VM-27-00-IF"
    location = azurerm_resource_group.rg00.location
    resource_group_name = azurerm_resource_group.rg00.name

    ip_configuration {
      name = "default"
      subnet_id = azurerm_subnet.sub_172-27-0-0_24.id
      private_ip_address_allocation = "Dynamic"
    }
  
}

resource "azurerm_linux_virtual_machine" "vm-27-00" {
  name                = "vm-27-00"
  resource_group_name = azurerm_resource_group.rg00.name
  location            = azurerm_resource_group.rg00.location
  size                = "Standard_F2"
  
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm-27-00-if.id
  ]

  admin_password = "TestPass1"
  disable_password_authentication = "false"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}










resource "azurerm_network_interface" "vm-28-00-if" {
    name = "VM-28-00-IF"
    location = azurerm_resource_group.rg00.location
    resource_group_name = azurerm_resource_group.rg00.name

    ip_configuration {
      name = "default"
      subnet_id = azurerm_subnet.sub_172-28-0-0_24.id
      private_ip_address_allocation = "Dynamic"
    }
  
}

resource "azurerm_linux_virtual_machine" "vm-28-00" {
  name                = "vm-28-00"
  resource_group_name = azurerm_resource_group.rg00.name
  location            = azurerm_resource_group.rg00.location
  size                = "Standard_F2"
  
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm-28-00-if.id
  ]

  admin_password = "TestPass1"
  disable_password_authentication = "false"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}