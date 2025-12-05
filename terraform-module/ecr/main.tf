resource "aws_ecr_repository" "repos" {
  for_each = var.repositories
  name     = each.key
}

resource "aws_ecr_lifecycle_policy" "lifecycle" {
  for_each = {
    for name, cfg in var.repositories :
    name => cfg
    if lookup(cfg, "lifecycle_policy", null) != null
  }

  repository = each.key
  policy     = each.value.lifecycle_policy
}
