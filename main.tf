module "account" {
  source = "./modules/account"

  create_account = var.create_account
  project_id     = var.project_id
  name           = var.name
}

module "key" {
  source = "./modules/key"

  project_id            = var.project_id
  service_account_email = coalesce(module.account.email, var.service_account_email)
  keys                  = var.keys
}

module "federation" {
  source = "./modules/federation"

  project_id            = var.project_id
  service_account_email = coalesce(module.account.email, var.service_account_email)
  federations           = var.federations
}
