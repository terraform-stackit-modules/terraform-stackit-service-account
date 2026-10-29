resource "stackit_service_account_federated_identity_provider" "this" {
  for_each = var.federations

  project_id            = var.project_id
  service_account_email = var.service_account_email
  name                  = each.value.name
  issuer                = each.value.issuer

  assertions = each.value.assertions
}
