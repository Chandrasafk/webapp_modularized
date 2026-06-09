#creating an ubuntu instance and install/enable apache2
resource "aws_instance" "web-server" {
  ami           = var.compute_ami
  instance_type = var.compute_instance_type
  availability_zone = var.compute_availability_zone
  key_name = var.compute_key_name
  network_interface {
    network_interface_id = var.network_interface_id
    device_index         = 0
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo "Hello World from Terraform" > /var/www/html/index.html'
              EOF
  tags = {
    Name = "web-server"
  }
}