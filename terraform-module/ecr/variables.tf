variable "repositories" {
  description = "Map of ECR repositories to create"
  type = map(object({
    name                 = string
    image_tag_mutability = optional(string)
    force_delete         = optional(bool)
    tags                 = optional(map(string))
  }))
}

variable "default_tags" {
  description = "Default tags to apply to all ECR repositories"
  type        = map(string)
  default     = {}
}
