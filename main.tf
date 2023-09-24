terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "connormaglynn"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "infrastructure"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }
}
