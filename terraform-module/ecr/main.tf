resource "aws_ecr_repository" "this" {
  for_each = var.repositories

  name                 = each.value.name
  image_tag_mutability = lookup(each.value, "image_tag_mutability", "MUTABLE")
  force_delete         = lookup(each.value, "force_delete", false)

  encryption_configuration {
    encryption_type = lookup(each.value, "encryption_type", "AES256")
    kms_key         = lookup(each.value, "kms_key", null)
  }

  image_scanning_configuration {
    scan_on_push = lookup(each.value, "scan_on_push", false)
  }

  tags = merge(var.default_tags, lookup(each.value, "tags", {}))
}
