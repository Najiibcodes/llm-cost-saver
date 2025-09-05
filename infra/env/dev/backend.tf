terraform {
  backend "s3" {
    bucket         = "llm-metrics-terraform-state"
    key            = "dev/network.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
