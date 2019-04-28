variable "prefix" {
  default = "plsr-"
}

variable "netz_count" {
  default = 3
}

variable "netz" {
  description = "Internal networks"
  type        = "list"
  default     = ["192.52.32.0/20", "10.0.0.0/8", "132.230.0.0/16"]
}

variable "os_image" {
  default = "Ubuntu 18.04"
}

variable "sg_webservice" {
  type    = "list"
  default = ["egress", "ufr-ssh", "public-ping", "public-web"]
}

variable "sg_rabbitservice" {
  type    = "list"
  default = ["egress", "ufr-ssh", "public-ping", "public-rabbitmq"]
}


variable "glx_disk_size" {
  default = 30
}

variable "flavors" {
  type = "map"
  default = {
    "glx" = "m1.large"
    "rabbit" = "m1.medium"
  }
}
