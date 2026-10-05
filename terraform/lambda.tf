data "aws_caller_identity" "current" {}

resource "aws_lambda_function" "addition" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn

  package_type = "Image"

  image_uri = "${aws_ecr_repository.lambda.repository_url}:${var.image_tag}"

  timeout     = 30
  memory_size = 128

  architectures = ["x86_64"]

  depends_on = [
    aws_iam_role_policy_attachment.lambda_basic_execution
  ]
}
