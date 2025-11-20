variable "subnet_name" {
    type = string  
}

variable "vnet_name" {
    type = string  
}

variable "pip_name" {
  type = string
}

variable "public_ip_name" {
    type = string  
}

variable "todo-linux_VM" {
  type = string
}
variable "admin_password" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "todo-publisher" {
  type = string       
}
variable "todo-offer" {
  type = string
}
variable "todo-sku" {
  type = string
}
variable "todo-version" {
  type = string
}