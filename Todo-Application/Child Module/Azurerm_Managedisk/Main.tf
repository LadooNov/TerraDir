

resource "azurerm_managed_disk" "Mdisk" {
  name                 = vnet.mdisk_name
  location             = vnet.location
  resource_group_name  = vnet.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
}
