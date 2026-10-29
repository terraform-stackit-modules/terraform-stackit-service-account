variable "project_id" {
  description = "STACKIT project ID to which the federated identity provider is associated."
  type        = string
}

variable "service_account_email" {
  description = "Email of the service account the federated identity provider belongs to."
  type        = string
}

variable "federations" {
  description = <<-EOT
    Map of federated identity providers to attach to the service account, keyed by a stable identifier. Each value:
      - `name`      : name of the federated identity provider.
      - `issuer`    : issuer URL.
      - `assertions`: optional list of `{ item, operator, value }`; at least one assertion with the claim `aud` is required, the only supported operator is `equals`.
  EOT
  type = map(object({
    name   = string
    issuer = string
    assertions = optional(list(object({
      item     = string
      operator = string
      value    = string
    })))
  }))
  default = {}
}
