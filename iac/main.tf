terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.41.0"
        }
    }
}

variable "access_key" {}
variable "secret_key" {}

provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
}

// AWS

// security group
resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.aws.id
}

# resource "aws_vpc" "aws" {
#     cidr_block = "10.114.0.0/24"
# }

# resource "aws_subnet" "aws" {
#     vpc_id     = aws_vpc.aws.id
#     cidr_block = cidrsubnet("10.114.0.0/24", 1, 0)
#     map_public_ip_on_launch = true
# }

# resource "aws_main_route_table_association" "aws" {
#   vpc_id         = aws_vpc.aws.id
#   route_table_id = aws_route_table.aws.id
# }

# resource "aws_route_table" "aws" {
#     vpc_id = aws_vpc.aws.id
    
#     route {
#         cidr_block = "10.114.0.0/24"
#         gateway_id = "local"
#     }
# }
