variable "repositories" {
  type    = list(string)
  default = []
}

variable "sts" {
  type = object({
    iam_policy_name = string
    iam_role_name   = string
  })
  default = {
    iam_policy_name = "ecr-pull-policy"
    iam_role_name   = "ecr-role-name"
  }
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


# Readers
variable "readers_users" {
  type        = list(string)
  default     = []
  description = "List with the iam user readers"
}

variable "readers_users_group" {
  type = object({
    name = string
    path = string
  })
  default = {
    name = "ecr"
    path = "ecr"
  }
}