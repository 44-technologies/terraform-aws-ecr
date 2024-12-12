locals {
  power_users_enabled = length(var.power_users) > 0 ? 1 : 0
  sts_enabled         = length(var.sts_iams) > 0 ? 1 : 0
}