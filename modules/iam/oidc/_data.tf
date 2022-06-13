data "aws_iam_policy_document" "oidc_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

#data "aws_iam_policy_document" "oidc_trust" {
#    Statement = {
#      sid = "sid"
#      Action = "sts:AssumeRoleWithWebIdentity",
#      Effect = "Allow",
#      Principal = {
#        Federated = "arn:aws:iam::927527504075:oidc-provider/token.actions.githubusercontent.com"
#
#      Condition = {
#      StringLike = [
#      "token.actions.githubusercontent.com:sub" : "repo:",
#      "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
#    ]
#    }
#
#}