variable "vpc_name" {
    type = string
    description = "first-vpc"
    default = "first-vpc"
}
variable "vpc_cidr" {
    type = string
    description = "CIDR block for the VPC"
    default = "10.0.0.0/16"
}

variable "igw_name" {
    type = string
    description = "gw"
    default = "gw"
}
variable "igw_tags" {
    type = string
    description = "main"
    default = "main"
}

variable "route_table_name" {
    type = string
    description = "example"
    default = "example"
}
variable "route_table_cidr" {
    type = string
    description = "CIDR block for the route"
    default = "0.0.0.0/0"
}
variable "route_table_tags" {
    type = string
    description = "example"
    default = "example"
}

variable "subnet_name" {
    type = string
    description = "first-subnet"
    default = "first-subnet"
}
variable "subnet_cidr" {
    type = string
    description = "CIDR block for the subnet"
    default = "10.0.1.0/24"
}
variable "subnet_az" {
    type = string
    description = "Availability zone for the subnet"
    default = "ap-south-2a"
}
variable "subnet_tags" {
    type = string
    description = "first-subnet"
    default = "first-subnet"
}

variable "security_group_name" {
    type = string
    description = "allow_web"
    default = "allow_web"
}
variable "security_group_description" {
    type = string
    description = "Description for the security group"
    default = "Allow web inbound traffic and all outbound traffic"
}
variable "security_group_tags" {
    type = string
    description = "allow_web"
    default = "allow_web"
}

variable "ingress_cidr1" {
    type = string
    description = "CIDR block for the ingress rule"
    default = "0.0.0.0/0"
}
variable "ingress_from_port1" {
    type = number
    description = "Starting port for the ingress rule"
    default = 80
}
variable "ingress_to_port1" {
    type = number
    description = "Ending port for the ingress rule"
    default = 80
}
variable "ingress_protocol1" {
    type = string
    description = "Protocol for the ingress rule"
    default = "tcp"
}

variable "ingress_from_port2" {
    type = number
    description = "Starting port for the ingress rule"
    default = 443
}
variable "ingress_to_port2" {
    type = number
    description = "Ending port for the ingress rule"
    default = 443
}

variable "ingress_from_port3" {
    type = number
    description = "Starting port for the ingress rule"
    default = 22
}
variable "ingress_to_port3" {
    type = number
    description = "Ending port for the ingress rule"
    default = 22
}

variable "egress_cidr" {
    type = string
    description = "CIDR block for the egress rule"
    default = "0.0.0.0/0"
}
variable "egress_protocol" {
    type = string
    description = "Protocol for the egress rule"
    default = "-1"
}

variable "network_interface_private_ip" {
    type = string
    description = "Private IP address for the network interface"
    default = "10.0.1.50"
}

variable "elastic_ip_domain" {
    type = string
    description = "Domain for the elastic IP"
    default = "vpc"
}
variable "elastic_ip_associate_with_private_ip" {
    type = string
    description = "Private IP address to associate with the elastic IP"
    default = "10.0.1.50"
}