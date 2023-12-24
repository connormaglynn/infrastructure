terraform {
  backend "remote" {
    organization = "connormaglynn"
    workspaces {
      name = "infrastructure"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
