terraform {
  backend "s3" {
    bucket = "jenkins-bucket-henry"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}