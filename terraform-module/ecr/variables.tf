variable "repositories" {
  type = map(object({
    name                 = string
    encryption_type      = string
    kms_key              = string
    image_tag_mutability = string
    scan_on_push         = bool
    tags                 = any
    lifecycle_policy     = string
  }))
}
