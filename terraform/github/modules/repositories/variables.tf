variable "repositories" {
  type = list(object({
    name        = string
    description = optional(string)
    visibility  = optional(string)
  }))
  default = [
    {
      name        = null
      description = "This repository is managed in Terraform"
      visibility  = "public"
    }
  ]
}

