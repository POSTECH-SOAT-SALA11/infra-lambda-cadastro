terraform {
  backend "s3" {
    bucket = var.s3_backend_bucket_name
    key    = "lambda-cadastro/terraform.tfstate"
    region = var.aws_region
  }
}
