resource "azurerm_resource_group" "core" {
  name     = "core"
  location = "${var.loc}"
  tags     = "${var.tags}"
}

resource "azurerm_public_ip" "vpnGatewayPublicIp" {
  name                = "vpnGatewayPublicIp"
  location            = "${azurerm_resource_group.core.location}"
  tags                = "${azurerm_resource_group.core.tags}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network" "core" {
  location            = "${azurerm_resource_group.core.location}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  tags                = "${azurerm_resource_group.core.tags}"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "TrainingSubnet"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "DevSubnet"
    address_prefix = "10.0.2.0/24"
  }
}
