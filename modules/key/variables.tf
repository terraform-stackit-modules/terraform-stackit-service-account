variable "project_id" {
  description = "STACKIT project ID to which the service account key is associated."
  type        = string
}

variable "service_account_email" {
  description = "Email of the service account the key belongs to."
  type        = string
}

variable "keys" {
  description = <<-EOT
    Map of service account keys to create, keyed by a stable identifier. Each value:
      - `public_key`         : optional RSA2048 public key; if not provided, STACKIT generates the key pair.
      - `rotate_when_changed`: optional map whose change forces key recreation (rotation).
      - `ttl_days`           : optional key validity in days; if unset, the key is valid until deleted.
  EOT
  type = map(object({
    public_key          = optional(string)
    rotate_when_changed = optional(map(string))
    ttl_days            = optional(number)
  }))
  default = {}
}
