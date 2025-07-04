terraform {
   required_version = ">= 1.0.0"
   required_providers {
       aws = {
         source  = "hashicorp/aws"
         version = "4.22.0"
       }
   }

    backend "s3" {
    bucket="bucket-name"
    key="default/customername/terraform.tfstate"
    region="ap-south-1"

   }
}

provider "aws" {
 
  region = "ap-south-1"

}
