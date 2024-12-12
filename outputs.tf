# Store the Access key in an Output variables
output "aws_ecr_repositories_arn" {
  value = { for k, r in aws_ecr_repository.this : k => r.arn }
}

