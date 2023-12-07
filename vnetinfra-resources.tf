resource "azurerm_network_interface" "vmmgmt00-if" {
  name = "VMMGMT00-IF"
  location = var.LOCATION
  resource_group_name = var.RGINFRA

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnet-10-255-0-0_24.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vmmgmt00" {
  name                = "VMMGMT00"
  resource_group_name = var.RGINFRA
  location            = var.LOCATION
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vmmgmt00-if.id,
  ]
  disable_password_authentication = "false"
  admin_password = "TestPass1"

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