# Basic web-server
## security group for web server (allows web server to be public)
#resource "aws_security_group" "instance" {
#  name = "terraform-example-instance"
#
#  ingress {
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}

# EC2 instance with a basic web server
#resource "aws_instance" "example" {
#  ami                    = "ami-0aaa5410833273cfe"
#  instance_type          = "t2.nano"
#  vpc_security_group_ids = [aws_security_group.instance.id]
#
#  user_data = <<-EOF
#              #!/bin/bash
#              echo "Hello, World" > index.html
#              nohup busybox httpd -f -p 8080 &
#              EOF
#
#  user_data_replace_on_change = true
#
#  tags = {
#    Name = "terraform-example"
#  }
#}
# -----------------------------------------------------------------------

# Variables example
#variable "number_example" {
#  description = "An example of a number variable in Terraform"
#  type        = number
#  default     = 42
#}
#
#variable "list_example" {
#  description = "An example of a list in Terraform"
#  type = list
#  default = ["a","b","c"]
#}
#
#variable "list_numeric_example" {
#  description = "An example of a list with constraint in Terraform"
#  type = list(number)
#  default = [1,2,3]
#}
#
#variable "map_example" {
#  description = "An example of a map in Terraform"
#  type        = map(string)
#  default = {
#    key1 = "value1"
#    key2 = "value2"
#    key3 = "value3"
#  }
#}
#
#variable "object_example" {
#  description = "An example of a structural type in Terraform"
#  type        = object({
#    name    = string
#    age     = number
#    tags    = list(string)
#    enabled = bool
#  })
#
#  default = {
#    name    = "value1"
#    age     = 42
#    tags    = ["a", "b", "c"]
#    enabled = "true"
#  }
#}
# -----------------------------------------------------------------------

# Deploy Cluster of Servers
## variables for server cluster
variable "server_port" {
  description = "Port for servers"
  type = number
  default = 8080
}

## data sources for server cluster
data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

## security group for web server (allows web server to be public)
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## a launch configuration to be used by auto-scaling groupes
resource "aws_launch_configuration" "server_cluster_example" {
  image_id        = "ami-0aaa5410833273cfe"
  instance_type   = "t2.nano"
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  # Required when using a launch configuration with an auto scaling group.
  lifecycle {
    create_before_destroy = true
  }
}

## definition of server cluster
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.server_cluster_example.name
  vpc_zone_identifier  = data.aws_subnets.default.ids

  min_size = 2
  max_size = 3

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
# -----------------------------------------------------------------------
