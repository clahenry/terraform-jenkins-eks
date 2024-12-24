terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-henry"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}