
resource "aws_ecr_repository" "this" {
  provider = aws.ecr

  for_each = toset(var.repositories)

  name                 = each.key
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}


resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  provider = aws.ecr

  for_each = toset(var.repositories)

  repository = aws_ecr_repository.this[each.key].name

  policy = templatefile("${path.module}/templates/ecr_lifecycle_policy.tftpl", { 
    untagged_unit : var.untagged_policy.unit, 
    untagged_count: var.untagged_policy.count,
    tagged_pattern : var.tagged_policy.pattern, 
    tagged_count: var.tagged_policy.count }
    )
}

