resource "azurerm_resource_group" "core" {
  name     = "core"
  location = "${var.loc}"
  tags     = "${var.tags}"
}

resource "azurerm_virtual_network" "core" {
  name                = "core"
  location            = "${var.loc}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "training"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "dev"
    address_prefix = "10.0.2.0/24"
  }
}

resource "azurerm_public_ip" "vpnGatewayPublicIP" {
  name                         = "vpnGatewayPublicIP"
  resource_group_name          = "${azurerm_resource_group.core.name}"
  public_ip_address_allocation = "dynamic"
  location                     = "${var.loc}"
}
