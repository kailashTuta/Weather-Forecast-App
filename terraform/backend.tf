terraform {
  backend "s3" {
    bucket = "kailash.project.monobucket"
    key    = "ec2/terraform.tfstate"
    region = "ap-south-1"
  }
}
