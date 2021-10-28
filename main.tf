terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.62.0"
    }
  }
}

provider "aws" {
  region = var.aws_default_region
}

# for creating Consul Gossip encryption key
provider "random" {}

# filter out wavelength zones
data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "group-name"
    values = [var.aws_default_region]
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}