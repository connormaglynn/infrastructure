terraform {
  backend "remote" {
    organization = "connormaglynn"
    workspaces {
      name = "aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}
