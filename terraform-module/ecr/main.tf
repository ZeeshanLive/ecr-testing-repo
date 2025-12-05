resource "aws_ecr_repository" "this" {
  for_each = var.repositories

  name                 = each.value.name
  image_tag_mutability = each.value.image_tag_mutability

  encryption_configuration {
    encryption_type = each.value.encryption_type
    kms_key         = lookup(each.value, "kms_key", null)
  }

  image_scanning_configuration {
    scan_on_push = each.value.scan_on_push
  }

  tags = each.value.tags
}

# Manage lifecycle policies
resource "aws_ecr_lifecycle_policy" "this" {
  for_each = { for k, v in var.repositories : k => v if contains(keys(v), "lifecycle_policy") && v.lifecycle_policy != "" }

  repository = each.value.name
  policy     = each.value.lifecycle_policy
}
