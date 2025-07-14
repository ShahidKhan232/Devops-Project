terraform {
  backend "s3" {
    bucket = "sts-microservices-5555"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
