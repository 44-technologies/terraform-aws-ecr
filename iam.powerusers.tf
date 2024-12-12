## IAM Group for ECR Power Users

data "aws_iam_policy" "ecr_power_user" {
  provider = aws.ecr
  name     = "AmazonEC2ContainerRegistryPowerUser"
}

#TODO: Improvement to only restrain power user to ecr registries


resource "aws_iam_group" "ecr_power_user_group" {
  provider = aws.ecr
  count    = local.power_users_enabled

  name = var.power_users_group.name
  path = "/${var.power_users_group.path}/"
}

resource "aws_iam_group_policy_attachment" "test-ecr_power_user_group_policy" {
  provider = aws.ecr
  count    = local.power_users_enabled

  group      = aws_iam_group.ecr_power_user_group[0].name
  policy_arn = data.aws_iam_policy.ecr_power_user.arn
}

resource "aws_iam_group_membership" "ecr_power_user_group_member" {
  provider = aws.ecr
  count    = local.power_users_enabled

  name = "${var.power_users_group.name}-members"

  users = var.power_users

  group = aws_iam_group.ecr_power_user_group[0].name
}


