###############################################################
# Provider Configuration
################################################################

provider "aws"  {
  region     = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}


terraform {
  backend "s3" {
    bucket = "shaniterraform"
   key    = "myproject/dev/terraform.tfstate"
   region = "us-east-2"
   access_key = ""
  secret_key = ""
  dynamodb_table="terraform_lock"

  }
}


################################################################
# VPC creation
################################################################

resource "aws_vpc" "blog" {
  cidr_block       = "172.18.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "blog"
  }
}

