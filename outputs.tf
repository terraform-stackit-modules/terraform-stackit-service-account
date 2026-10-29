output "service_account_id" {
  description = "The internal ID of the service account (created, or null when `create_account` is false)."
  value       = module.account.service_account_id
}

output "service_account_email" {
  description = "The email of the service account (created, or the provided `service_account_email` when `create_account` is false)."
  value       = coalesce(module.account.email, var.service_account_email)
}

output "key_ids" {
  description = "Map of key identifier to key ID."
  value       = module.key.key_ids
}

output "keys_json" {
  description = "Map of key identifier to the service account key JSON credentials. Sensitive — store in a secrets manager."
  value       = module.key.keys_json
  sensitive   = true
}

output "federation_ids" {
  description = "Map of federation identifier to federation ID."
  value       = module.federation.federation_ids
}
