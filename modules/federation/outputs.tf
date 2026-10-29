output "federation_ids" {
  description = "Map of federation identifier to federation ID."
  value       = { for k, f in stackit_service_account_federated_identity_provider.this : k => f.federation_id }
}
