provider "aws" {
  region  = "eu-central-1"
  profile = "default"
}

data "aws_caller_identity" "current" {
}

data "aws_availability_zones" "available" {
}

