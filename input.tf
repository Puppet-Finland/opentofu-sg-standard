variable "vpc_id" {
  type = string
}

variable "basename" {
  type = string
}

variable "allow_ssh_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_ssh_ipv6_cidr_blocks" {
  type    = list(string)
  default = ["::/0"]
}
