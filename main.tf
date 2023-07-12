terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "connormaglynn"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
