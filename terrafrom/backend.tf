# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "terraform-state-aws-learner"
    key            = "rentzone/terraform.tfstate"
    region         = "us-east-1"
    profile        = "aws_learner"
    dynamodb_table = "terraform-state-lock"
  }
}