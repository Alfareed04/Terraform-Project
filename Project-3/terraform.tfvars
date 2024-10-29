resource_name = "Project3-rg"
location = "East US"

vnets={
    "project3_vnet" ={
        name="project3_vnet"
        address_space="10.2.0.0/16"
    }
}

subnets = {
  "subnet1" = {
    subnet_name = "subnet1"
    address_prefix = "10.2.1.0/24"
  },
  "subnet2" = {
    subnet_name = "subnet2"
    address_prefix = "10.2.2.0/24"
  },
  "subnet3" = {
    subnet_name = "subnet3"
    address_prefix = "10.2.3.0/24"
  },
  "subnet4" = {
    subnet_name = "subnet4"
    address_prefix = "10.2.4.0/24"
  }
}

nsg = {
  "nsg-1" = {
    nsg_name = "nsg-1"
  },
  "nsg-2" = {
    nsg_name = "nsg-2"
  },
  "nsg-3" = {
    nsg_name = "nsg-3"
  },
  "nsg-4" = {
    nsg_name = "nsg-4"
  },
}

  security_rules= {
    "security_rules1" = {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },
    "security_rules2" = {
    name                       = "allow_http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
    "security_rules3" = {
    name                       = "allow_https"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

route_tables = {
  "route1" = {
    route_table_name = "route1"
  },
  "route2" = {
    route_table_name = "route2"
  },
  "route3" = {
    route_table_name = "route3"
  },
  "route4" = {
    route_table_name = "route4"
  }
}

