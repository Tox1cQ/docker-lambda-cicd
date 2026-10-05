variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "addition-lambda-cicd"
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "addition-lambda-cicd"
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "1.0"
}
