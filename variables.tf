# ─── Core ─────────────────────────────────────────────────────────────────────

variable "project_id" {
  description = "STACKIT project ID to which the service account, its keys and its federated identity providers are associated."
  type        = string
}

# ─── Service account ──────────────────────────────────────────────────────────

variable "create_account" {
  description = "Whether to create the service account. Set to false to manage keys and federations of an existing service account provided via `service_account_email`."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the service account."
  type        = string
  default     = null
}

variable "service_account_email" {
  description = "Email of an existing service account. Used when `create_account` is false."
  type        = string
  default     = null
}

# ─── Keys ─────────────────────────────────────────────────────────────────────

variable "keys" {
  description = <<-EOT
    Map of service account keys to create, keyed by a stable identifier. Each value:
      - `public_key`         : optional RSA2048 public key; if not provided, STACKIT generates the key pair.
      - `rotate_when_changed`: optional map whose change forces key recreation (rotation).
      - `ttl_days`           : optional key validity in days; if unset, the key is valid until deleted.
    The generated key JSON credentials are exposed via the `keys_json` output (sensitive).
  EOT
  type = map(object({
    public_key          = optional(string)
    rotate_when_changed = optional(map(string))
    ttl_days            = optional(number)
  }))
  default = {}
}

# ─── Federated identity providers ──────────────────────────────────────────────

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
