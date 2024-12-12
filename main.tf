
resource "aws_ecr_repository" "this" {
  provider = aws.ecr

  for_each = toset(var.repositories)

  name                 = each.key
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}


resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy_untagged" {
  provider = aws.ecr

  for_each = toset(var.repositories)

  repository = aws_ecr_repository.this[each.key].name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "ECR Clean Untagged",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

