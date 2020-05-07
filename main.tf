// Configure remote state location here...
terraform {
  backend "s3" {
    bucket = "owner-terraform-state12112"
    key    = "project/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region  = "eu-west-2"
}

