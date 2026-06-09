output "vpc_name"{
    value = aws_vpc.first-vpc.id
}

output "vpc_cidr"{
    value = aws_vpc.first-vpc.cidr_block
}

output "elastic_ip_network_interface_id"{
    value = aws_network_interface.test.id
}

output "elastic_ip"{
    value = aws_eip.one.public_ip
}