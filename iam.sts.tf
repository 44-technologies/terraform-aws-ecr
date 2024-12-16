
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
  count    = local.sts_enabled

  name               = var.sts.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
}


resource "aws_iam_policy" "ecr_sts_iam_policy" {
  provider = aws.ecr
  count    = local.sts_enabled

  name        = var.sts.iam_policy_name
  description = "Enable to Pull from ECR"
  policy      = templatefile("${path.module}/templates/ecr_read_role_policy.tftpl", {})
}


resource "aws_iam_role_policy_attachment" "power_user_policy" {
  provider = aws.ecr
  count    = local.sts_enabled

  role       = aws_iam_role.ecr_iam_role[0].name
  policy_arn = aws_iam_policy.ecr_sts_iam_policy[0].arn
}

