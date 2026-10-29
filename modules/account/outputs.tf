output "service_account_id" {
  description = "The internal ID of the service account (null when `create_account` is false)."
  value       = var.create_account ? stackit_service_account.this[0].service_account_id : null
}

output "email" {
  description = "The email of the service account (null when `create_account` is false)."
  value       = var.create_account ? stackit_service_account.this[0].email : null
}
