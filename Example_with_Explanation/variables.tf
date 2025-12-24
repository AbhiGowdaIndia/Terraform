variable "root_key_name" {
  type    = string
  default = "my_pem"
}

variable "root_key_path" {
  type    = string
  default = "./keys/tera.pem"
}

variable "root_sg_name" {
  type    = string
  default = "terra-sg"
}

variable "root_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "root_ec2_username" {
  type    = string
  default = "ubuntu"
}

variable "root_source_path" {
  type    = string
  default = "./config/nginx.conf"
}

variable "root_destination_path" {
  type    = string
  default = "/home/ubuntu/nginx.conf"
}

variable "root_inline_commands" {
  type = list(string)

  default = [
    "sudo apt update",
    "sudo apt install -y nginx git",
    "echo 'This is a remote-exec example' > remote-exec.txt"
  ]
}