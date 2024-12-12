variable "repositories" {
  type    = list(string)
  default = []
}

variable "ecr_iam_policy_name" {
  type    = string
  default = "ecr_iam_policy_name"
}


variable "ecr_iam_role_name" {
  type    = string
  default = "ecr_iam_role_name"
}


# Power Users
variable "power_users" {
  type        = list(string)
  default     = []
  description = "List with the names of the iam user already created"
}

variable "power_users_group" {
  type = object({
    name = string
    path = string
  })
  default = {
    name = "devops"
    path = "devops"
  }
}


variable "sts_iams" {
  type        = list(string)
  default     = []
  description = "List with the names of the iam user already created"
}
