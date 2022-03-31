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
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_route53_zone" "primary" {
  name = "connorglynn.com"
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "connorglynn.com"
  type    = "A"
  ttl     = "300"
  records = ["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.connorglynn.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["connormaglynn.github.io"]
}

output "name_servers" {
  value = aws_route53_zone.primary.name_servers
}