module "todo-rg" {
source = "../../Child Module/azurerm_azure_resourcegrup"
rg_name = "Dev-Todo-Resource-Group"
location = "central india"
}

module "todo-vnet" {
  depends_on = [ module.todo-rg ]
  source              = "../../Child Module/Azurerm_VirtualNetwork"
  vnet_name           = "Dev-Todo-VNet"
  location            = "central india"
  resource_group_name = "Dev-Todo-Resource-Group"
  address_space       = ["10.10.10.0/24"]

}

 module "todo-frontend-subnet" {
  depends_on = [ module.todo-vnet ]
  source                  = "../../Child Module/Azurerm_subnet"
  subnet_name             = "Dev-Todo-Frontend-Subnet"
  resource_group_name     = "Dev-Todo-Resource-Group"
  virtual_network_name    = "Dev-Todo-VNet"
  address_prefixes        = ["10.10.10.0/25"]
 }

module "todo-backend-subnet" {
  depends_on = [ module.todo-vnet ]
  source                  = "../../Child Module/Azurerm_subnet"
  subnet_name             = "Dev-Todo-Backend-Subnet"
  resource_group_name     = "Dev-Todo-Resource-Group"
  virtual_network_name    = "Dev-Todo-VNet"
  address_prefixes        = ["10.10.10.128/25"]
}

module "todo-nic" {
  depends_on = [ module.todo-frontend-subnet ]
  source              = "../../Child Module/Azurerm_network Interface"
  nic_name            = "Dev-Todo-NIC"
  location            = "central india"
  resource_group_name = "Dev-Todo-Resource-Group"
  ip_configuration_name = "Dev-Todo-IP-Config"
  subnet_id            = module.todo-frontend-subnet.subnet_id
}

module "todo-linux-VM" {
  depends_on = [ module.todo-nic ]
  source              = "../../Child Module/Azurerm_VirtualMachine"
  public_ip_name      = "Dev-Todo-Public-IP"
  todo-linux_VM       = "Dev-Todo-Linux-VM"
  admin_username      = "adminuser"
  admin_password      = "Admin@12345"
  vm_size             = "Standard_F2"
  location            = "central india"
  resource_group_name = "Dev-Todo-Resource-Group"
  todo-publisher      = "Canonical"
  todo-offer          = "0001-com-ubuntu-server-jammy"  
  todo-sku            = "22_04-lts"
  todo-version        = "latest"
}
