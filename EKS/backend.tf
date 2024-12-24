terraform {
  backend "s3" {
    bucket = "jenkins-bucket-henry"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}