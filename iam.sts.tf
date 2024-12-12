
data "aws_iam_policy_document" "assume_role" {
  provider = aws.ecr

  count = local.sts_enabled

  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = concat(var.sts_iams)
    }
  }
}

resource "aws_iam_role" "ecr_iam_role" {
  provider = aws.ecr
  name     = var.ecr_iam_role_name

  count = local.sts_enabled

  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
}


resource "aws_iam_policy" "ecr_iam_role_policy" {
  provider = aws.ecr

  count = local.sts_enabled

  name        = "ECR-Pull-Policy"
  description = "Enable to Pull from ECR"
  policy      = templatefile("${path.root}/templates/ecr_read_role_policy.tftpl", {})
}


resource "aws_iam_role_policy_attachment" "power_user_policy" {
  provider = aws.ecr

  role       = aws_iam_role.ecr_iam_role[0].name
  policy_arn = aws_iam_policy.ecr_iam_role_policy[0].arn

  count = local.sts_enabled
}
