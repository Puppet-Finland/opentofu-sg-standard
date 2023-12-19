variable "vpc_id" {
  type = string
}

variable "basename" {
  type = string
}

variable "allow_any_from_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

variable "allow_ssh_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_ssh_ipv6_cidr_blocks" {
  type    = list(string)
  default = ["::/0"]
}
