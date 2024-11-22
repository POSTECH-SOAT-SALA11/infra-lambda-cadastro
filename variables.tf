variable "lambda_function_name" {
  description = "Nome da função Lambda"
  type        = string
  default     = "lambda_cadastro_usuarios"
}

variable "s3_bucket_name" {
  description = "Nome do bucket S3 onde o código da Lambda está armazenado"
  type        = string
}

variable "lambda_s3_key" {
  description = "Caminho do arquivo zip da Lambda no S3"
  type        = string
}

variable "lambda_role_name" {
  description = "Nome da role IAM para a função Lambda"
  type        = string
  default     = "lambda_cad_users_exec_role"
}

variable "s3_backend_bucket_name" {
  description = "Nome do bucket S3 para armazenar o estado do Terraform"
  type        = string
}

variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "sa-east-1"
}
