
variable "oidc_url" {
   type = string
}

variable "audiance_list" {
   type = list
}

variable "thumbprint_list" {
   type = list
}

variable "policy_role" {
   type = string
}
variable "policies" {
  default = ""
}
variable "policy_arn" {
  default = ""
}