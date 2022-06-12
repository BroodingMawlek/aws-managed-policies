variable "oidc_url" {
  type    = string
  default = "https://token.actions.githubusercontent.com"
}

variable "audiance_list" {
  type    = string
  default = "sts.amazonaws.com"
}

variable "thumbprint_list" {
  type    = string
  default = "6938fd4d98bab03faadb97b34396831e3780aea1"
}

variable "policy_role" {
  type    = string
  default = "oidc_runner_role"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "policy_arn" {
  description = "List of policies to attach to OIDC role"
  type        = map(string)
  default     = {
    arn-1 = "arn:aws:iam::aws:policy/AutoScalingFullAccess",
    arn-2 = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    }
  }

#for_each = toset([data.aws_iam_policy.AutoScalingFullAccess.arn, data.aws_iam_policy.EKSClusterPolicy.arn,data.aws_iam_policy.SystemAdministrator.arn,
#data.aws_iam_policy.AWSMigrationHubFullAccess.arn,data.aws_iam_policy.EAmazonSSMFullAccess.arn,data.aws_iam_policy.AWSSupportAccess.arn,
#data.aws_iam_policy.AWSCertificateManagerFullAccess.arn,data.aws_iam_policy.AWSBackupFullAccess.arn])