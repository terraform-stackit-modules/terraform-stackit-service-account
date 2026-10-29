output "key_ids" {
  description = "Map of key identifier to key ID."
  value       = { for k, key in stackit_service_account_key.this : k => key.key_id }
}

output "keys_json" {
  description = "Map of key identifier to the service account key JSON credentials. Sensitive."
  value       = { for k, key in stackit_service_account_key.this : k => key.json }
  sensitive   = true
}
