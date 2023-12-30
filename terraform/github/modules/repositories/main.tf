terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

resource "github_repository" "repositories" {
  for_each = {
    for index, repository in var.repositories : repository.name => repository
  }
  name                      = each.value.name
  description               = each.value.description
  visibility                = each.value.visibility
  allow_merge_commit        = false
  allow_squash_merge        = true
  allow_rebase_merge        = false
  squash_merge_commit_title = "PR_TITLE"
  auto_init                 = true
  delete_branch_on_merge    = true
}