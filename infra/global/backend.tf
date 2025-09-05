terraform {
  backend "s3" {
    bucket         = "llm-metrics-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock" 
    encrypt        = true
  }
}

#having troubles adding native statelocking (will add later)