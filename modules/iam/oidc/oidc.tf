resource "aws_iam_openid_connect_provider" "default" {
  url = var.oidc_url
  client_id_list = var.audiance_list
  thumbprint_list = var.thumbprint_list
}


resource "aws_iam_role" "test_role" {
  name = var.policy_role
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Effect = "Allow",
            Principal = {
                Federated = "arn:aws:iam::927527504075:oidc-provider/token.actions.githubusercontent.com"
            },
            Action = "sts:AssumeRoleWithWebIdentity",
            Condition = {
                StringLike = {
                    "token.actions.githubusercontent.com:sub": "repo:",
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                }
            }
        }
    ]
})

}



resource "aws_iam_role_policy_attachment" "oidc_policies" {
  for_each = var.policy_arn
  role     = var.policy_role
  policy_arn = each.value
  depends_on = [
    aws_iam_role.test_role
  ]
}
