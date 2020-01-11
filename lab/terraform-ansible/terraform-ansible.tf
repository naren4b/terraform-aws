
variable "access_key" {
}
variable "secret_key" {
}
variable "region" {
}
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}


resource "aws_instance" "web-ui" {
  ami           = "ami-0b898040803850657"
  instance_type = "t2.micro"
  key_name      = "default_n_virginia"
  tags = {
    Name = "web-ui-${count.index + 1}"
  }
  count = 2
  provisioner "local-exec" {
    command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key ./default_n_virginia.pem -i '${element(aws_instance.web-ui[count.index].public_ip, count.index)},' web-apache.yml"
  }
}
