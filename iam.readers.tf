## IAM Group for ECR Power Users

data "aws_iam_policy" "ecr_readers" {
  provider = aws.ecr
  name     = "AmazonEC2ContainerRegistryReadOnly"
}

#TODO: Improvement to only restrain power user to ecr registries


resource "aws_iam_group" "ecr_readers_user_group" {
  provider = aws.ecr
  count    = local.readers_enabled

  name = var.readers_users_group.name
  path = "/${var.readers_users_group.path}/"
}

resource "aws_iam_group_policy_attachment" "ecr_readers_user_group_policy" {
  provider = aws.ecr
  count    = local.readers_enabled

  group      = aws_iam_group.ecr_readers_user_group[0].name
  policy_arn = data.aws_iam_policy.ecr_readers.arn
}

resource "aws_iam_group_membership" "ecr_readers_user_group_member" {
  provider = aws.ecr
  count    = local.readers_enabled

  name  = "${var.readers_users_group.name}-members"
  users = var.power_users
  group = aws_iam_group.ecr_readers_user_group[0].name
}


