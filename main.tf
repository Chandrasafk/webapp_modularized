terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-2"
}

module "Networking" {
  source = "./modules/Networking"
}

module "Compute" {
  source = "./modules/Compute"
  network_interface_id = module.Networking.elastic_ip_network_interface_id
}