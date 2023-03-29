terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
    
    aws = {
      source = "hashicorp/aws"
      version = "3.72.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "remote-state"
    storage_account_name = "jhonatajrremotestate"
    container_name       = "remotestate"
    key                  = "github-actions/terraform.tfstate"
  }
}


provider "azurerm" {
  features {

  }
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "remote-state"
    storage_account_name = "jhonatajrremotestate"
    container_name       = "remotestate"
    key                  = "azure-vnet/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      owner      = "jhonata"
      managed_by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "jhonata-remotestate-s3"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

