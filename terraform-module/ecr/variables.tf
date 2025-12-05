

variable "repositories" {
  type = map(object({
    lifecycle_policy = optional(string)
  }))
}

