data "aws_region" "current" {}

data "aws_organizations_organization" "example" {}

data "aws_organizations_organizational_units" "example" {
  parent_id = data.aws_organizations_organization.example.roots[0].id
}

resource "aws_controltower_control" "example" {
  control_identifier = "arn:aws:controltower:${data.aws_region.current.name}::control/AWS-GR_EC2_VOLUME_INUSE_CHECK"
  target_identifier = [
    for x in data.aws_organizations_organizational_units.example.children :
    x.arn if x.name == "Infrastructure"
  ][0]
}
