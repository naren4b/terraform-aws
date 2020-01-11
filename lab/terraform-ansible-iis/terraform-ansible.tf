
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


resource "aws_instance" "web-iis" {
  ami           = "ami-02b212aba9eb84405"
  instance_type = "t2.micro"
  key_name      = "default_n_virginia"
  tags = {
    Name = "web-iis"
  }

}
