# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "terraform-remotestate-bahram"
    key            = "terraform-module/rentzone/terraform.tfstate"
    region         = "us-east-1"
    profile        = "bahram"
    dynamodb_table = "terraform-state-lock"
  }
}