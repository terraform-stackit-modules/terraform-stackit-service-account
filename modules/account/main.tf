resource "stackit_service_account" "this" {
  count = var.create_account ? 1 : 0

  project_id = var.project_id
  name       = var.name
}
