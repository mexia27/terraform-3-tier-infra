terraform {
 backend "s3" {
  bucket = "aproka-bucket"
  key = "state/terraform.tfstate"
  region = "us-east-1"
  workspace_key_prefix = "env"

   
 }
}