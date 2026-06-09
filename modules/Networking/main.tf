#creating a vpc
resource "aws_vpc" "first-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

#creating an internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.first-vpc.id

  tags = {
    Name = var.igw_tags
  }
}

#creating a route table
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.first-vpc.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.route_table_tags
  }
}

#creating a subnet
resource "aws_subnet" "first-subnet" {
  vpc_id = aws_vpc.first-vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.subnet_az
  tags = {
    Name = var.subnet_tags
  }
}

#associating the route table with the subnet
resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.first-subnet.id
  route_table_id = aws_route_table.example.id
}

#creating a security group
resource "aws_security_group" "allow_web" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.first-vpc.id

  tags = {
    Name = var.security_group_tags
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_web" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = var.ingress_cidr1
  from_port         = var.ingress_from_port1
  ip_protocol       = var.ingress_protocol1
  to_port           = var.ingress_to_port1
  description       = "HTTP"
}

resource "aws_vpc_security_group_ingress_rule" "allow_webs" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = var.ingress_cidr1
  from_port         = var.ingress_from_port2
  ip_protocol       = var.ingress_protocol1
  to_port           = var.ingress_to_port2
  description       = "HTTPS"
}

resource "aws_vpc_security_group_ingress_rule" "allow_webss" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = var.ingress_cidr1
  from_port         = var.ingress_from_port3
  ip_protocol       = var.ingress_protocol1
  to_port           = var.ingress_to_port3
  description       = "SSH"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = var.egress_cidr
  ip_protocol       = var.egress_protocol # semantically equivalent to all ports
}

#creating a network interface
resource "aws_network_interface" "test" {
  subnet_id       = aws_subnet.first-subnet.id
  private_ips     = [var.network_interface_private_ip]
  security_groups = [aws_security_group.allow_web.id]

}

#creating an elastic IP
resource "aws_eip" "one" {
  domain                    = var.elastic_ip_domain
  network_interface         = aws_network_interface.test.id
  associate_with_private_ip = var.elastic_ip_associate_with_private_ip
  depends_on = [aws_internet_gateway.gw]
}