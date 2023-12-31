import {
  id = "firebase-playground"
  to = github_repository.repositories["firebase-playground"]
}

import {
  id = "learning-golang"
  to = github_repository.repositories["learning-golang"]
}

import {
  id = "tillysofcastleton.com"
  to = github_repository.repositories["tillysofcastleton.com"]
}

import {
  id = "developer-navigation-browser-plugin"
  to = github_repository.repositories["developer-navigation-browser-plugin"]
}

import {
  id = "typescript-template"
  to = github_repository.repositories["typescript-template"]
}

import {
  id = "connorglynn.com"
  to = github_repository.repositories["connorglynn.com"]
}

import {
  id = "learning-python"
  to = github_repository.repositories["learning-python"]
}

import {
  id = "shopping-cart-typescript"
  to = github_repository.repositories["shopping-cart-typescript"]
}

import {
  id = "imust-cli"
  to = github_repository.repositories["imust-cli"]
}

import {
  id = "gemsbook-keeping.co.uk"
  to = github_repository.repositories["gemsbook-keeping.co.uk"]
}

import {
  id = "garrettys.com"
  to = github_repository.repositories["garrettys.com"]
}


resource "github_repository" "repositories" {
  for_each = {
    for index, repository in var.repositories : repository.name => repository
  }
  name                      = each.value.name
  description               = each.value.description
  visibility                = each.value.visibility
  is_template               = each.value.is_template
  allow_merge_commit        = false
  allow_squash_merge        = true
  allow_rebase_merge        = false
  squash_merge_commit_title = "PR_TITLE"
  auto_init                 = true
  delete_branch_on_merge    = true
}