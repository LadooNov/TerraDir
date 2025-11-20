variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}