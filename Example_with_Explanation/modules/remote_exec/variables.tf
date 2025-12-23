variable "ec2_public_ip" {
  type = string
}

variable "ec2_username" {
  type = string
}

variable "ec2_pem" {
  type = string
}

variable "inline_commands" {
  type = list(string)
}