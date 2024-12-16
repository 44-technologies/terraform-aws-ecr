## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.ecr"></a> [aws.ecr](#provider\_aws.ecr) | >= 5.80.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.ecr_lifecycle_policy_untagged](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_group.ecr_power_user_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.ecr_readers_user_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.ecr_power_user_group_member](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.ecr_readers_user_group_member](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.ecr_readers_user_group_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.test-ecr_power_user_group_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.ecr_sts_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecr_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.power_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy.ecr_power_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.ecr_readers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_power_users"></a> [power\_users](#input\_power\_users) | List with the names of the iam user already created | `list(string)` | `[]` | no |
| <a name="input_power_users_group"></a> [power\_users\_group](#input\_power\_users\_group) | n/a | <pre>object({<br/>    name = string<br/>    path = string<br/>  })</pre> | <pre>{<br/>  "name": "devops",<br/>  "path": "devops"<br/>}</pre> | no |
| <a name="input_readers_users"></a> [readers\_users](#input\_readers\_users) | List with the iam user readers | `list(string)` | `[]` | no |
| <a name="input_readers_users_group"></a> [readers\_users\_group](#input\_readers\_users\_group) | n/a | <pre>object({<br/>    name = string<br/>    path = string<br/>  })</pre> | <pre>{<br/>  "name": "ecr",<br/>  "path": "ecr"<br/>}</pre> | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | `list(string)` | `[]` | no |
| <a name="input_sts"></a> [sts](#input\_sts) | n/a | <pre>object({<br/>    iam_policy_name = string<br/>    iam_role_name   = string<br/>  })</pre> | <pre>{<br/>  "iam_policy_name": "ecr-pull-policy",<br/>  "iam_role_name": "ecr-role-name"<br/>}</pre> | no |
| <a name="input_sts_iams"></a> [sts\_iams](#input\_sts\_iams) | List with the names of the iam user already created | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ecr_repositories_arn"></a> [aws\_ecr\_repositories\_arn](#output\_aws\_ecr\_repositories\_arn) | Store the Access key in an Output variables |
