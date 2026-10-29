resource "stackit_service_account_key" "this" {
  for_each = var.keys

  project_id            = var.project_id
  service_account_email = var.service_account_email
  public_key            = each.value.public_key
  rotate_when_changed   = each.value.rotate_when_changed
  ttl_days              = each.value.ttl_days
}
