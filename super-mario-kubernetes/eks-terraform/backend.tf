terraform {
  backend "s3" {
    bucket = "super-mario-bucket-5555"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
