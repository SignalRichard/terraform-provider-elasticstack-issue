terraform {
  required_version = "= 1.6.3"

  required_providers {
    elasticstack = {
      source = "elastic/elasticstack"
      version = "0.10.0"
    }
  }

  backend "local" {
  }
}

variable "elasticsearch_username" {
  type = string
  default = ""
}

variable "elasticsearch_password" {
  type = string
  default = ""
}

variable "elasticsearch_endpoint" {
  type = string
  default = ""
}

provider "elasticstack" {
  elasticsearch {
    username = var.elasticsearch_username
    password = var.elasticsearch_password
    endpoints = [var.elasticsearch_endpoint]
  }
}

data "elasticstack_elasticsearch_info" "cluster_info" {
  for_each = toset([])
}
