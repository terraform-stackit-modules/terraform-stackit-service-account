output "service_account_email" {
  description = "The email of the service account created by the example."
  value       = module.service_account.service_account_email
}

output "key_ids" {
  description = "The key IDs created by the example."
  value       = module.service_account.key_ids
}
