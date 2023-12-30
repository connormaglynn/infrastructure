resource "github_repository" "example_of_terraform_managed" {
  name                      = "example-of-terraform-managed-1"
  description               = "This repository is managed in Terraform"
  visibility                = "public"
  allow_merge_commit        = false
  allow_squash_merge        = true
  allow_rebase_merge        = false
  squash_merge_commit_title = "PR_TITLE"
  auto_init                 = true
  delete_branch_on_merge    = true
}

resource "github_repository" "infrastructure" {
  name                      = "infrastructure"
  description               = "This repository is managed in Terraform"
  visibility                = "public"
  allow_merge_commit        = false
  allow_squash_merge        = true
  allow_rebase_merge        = false
  squash_merge_commit_title = "PR_TITLE"
  auto_init                 = true
  delete_branch_on_merge    = true
}

import {
  id = "scripts"
  to = module.repositories.github_repository.repositories["scripts"]
}

module "repositories" {
  source = "./modules/repositories"
  repositories = [
    {
      name = "scripts"
    }
  ]
  providers = {
    github = github
  }
}