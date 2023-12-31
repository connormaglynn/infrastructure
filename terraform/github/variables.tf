variable "PAT_GITHUB_API_TOKEN" {
  type      = string
  sensitive = true
}

variable "repositories" {
  description = "All repositories managed in terraform"
  type = list(object({
    name        = string
    description = optional(string, "This repository is managed in Terraform")
    visibility  = optional(string, "public")
    is_template = optional(bool, false)
    topics      = optional(list(string), [])
  }))
}