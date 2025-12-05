variable "repositories" {
  type = map(object({
    name                 = string
    encryption_type      = string
    kms_key              = optional(string)
    image_tag_mutability = string
    scan_on_push         = bool
    tags                 = any
    lifecycle_policy     = optional(string)
  }))
}
