variable "compute_name" {
  type        = string
  description = "Name of the compute resource"
  default = "web-server"
}
variable "compute_ami" {
  type        = string
  description = "Ami id of the compute resource"
  default = "ami-024ebedf48d280810"
}
variable "compute_instance_type" {
  type        = string
  description = "Instance type of the compute resource"
  default = "t3.micro"
}
variable "compute_availability_zone" {
  type        = string
  description = "Availability zone for the compute resource"
  default = "ap-south-2a"
}
variable "compute_key_name" {
  type        = string
  description = "Key pair name for the compute resource"
  default = "hydkeypair"
}

variable "network_interface_id" {
  type = string
  description = "ID of the network interface"
}
