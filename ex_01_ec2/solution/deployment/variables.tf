variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
}

variable "profile" {
  type    = string
  default = "cta"
}

variable "project" {
  type    = string
  default = "exercise-01"
}

variable "public_cidr_blocks" {
  description = "CIDRs from which access is allowed"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_ports" {
  type = map(object({
    service  = string
    port     = string
    protocol = string
  }))
  default = {
    "0" = {
      service : "HTTP",
      port : "80",
      protocol : "tcp"
    },
    "1" = {
      service : "SSH",
      port : "22",
      protocol : "tcp"
    },
    "2" = {
      service : "PING",
      port : "8",
      protocol : "icmp"
    }
  }
}
