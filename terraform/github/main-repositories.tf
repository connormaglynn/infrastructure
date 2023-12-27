resource "github_repository" "example_of_terraform_managed" {
  name        = "example-of-terraform-managed"
  description = "This repository is managed in Terraform"
  visibility = "public"
  allow_merge_commit = "false"
  allow_squash_merge = "true"
  allow_rebase_merge = "false"
  squash_merge_commit_title = "PR_TITLE"
  auto_init = "true"
}