variable "repositories" {
  description = "Map of ECR repositories to manage"
  type = map(object({
    name               = string
    encryption_type    = string
    kms_key            = optional(string)
    scan_on_push       = bool
    image_tag_mutability = string
    tags               = map(string)
    lifecycle_policy   = optional(string)
  }))
}
