
resource "azurerm_network_security_group" "NSG" {
  name                = vnet.nsg_name   
  location            = vnet.location
  resource_group_name = vnet.resource_group_name


}