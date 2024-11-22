provider "aws" {
  region = "sa-east-1"
}

resource "aws_iam_role" "lambda_auth_clientes_exec_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

  inline_policy {
    name = "lambda-s3-access"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:GetObject",
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Action = [
            "cognito-idp:ListUsers",
            "cognito-idp:AdminGetUser",
            "cognito-idp:GetUser",
            "cognito-idp:AdminCreateUser"
          ]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Action = [
            "execute-api:ManageConnections"
          ]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }
}

#teste
resource "aws_lambda_function" "lambda_cad_clientes" {
  function_name = var.lambda_function_name
  s3_bucket     = var.s3_bucket_name
  s3_key        = var.lambda_s3_key
  handler       = "main.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_auth_clientes_exec_role.arn
  timeout       = 60
}
