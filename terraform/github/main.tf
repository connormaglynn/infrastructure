terraform {
  backend "remote" {
    organization = "connormaglynn"
    workspaces {
      name = "github"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
