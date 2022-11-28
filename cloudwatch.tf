resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  count             = var.create_cloudwatch ? 1 : 0
  name              = var.resource_name
  retention_in_days = var.retention_in_days
}


resource "aws_iam_policy" "resource_log_policy" {
  count       = var.create_cloudwatch ? 1 : 0
  name        = var.iam_policy_log_name
  path        = var.path #"/"
  description = "IAM policy for logging from ${var.resource_name}"
  policy      = file(var.policy_file) #file("modules/policies/lambda_cloudwatch.json")
}

resource "aws_iam_role_policy_attachment" "resource_logs_polcy_attachment" {
  count      = var.create_cloudwatch ? 1 : 0
  role       = var.role_name
  policy_arn = aws_iam_policy.resource_log_policy[count.index].arn
}
