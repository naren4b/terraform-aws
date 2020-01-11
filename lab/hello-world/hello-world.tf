
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

resource "aws_instance" "my-ubuntu" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}

