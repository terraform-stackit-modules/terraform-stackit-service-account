#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module.
#
# This example is self-contained and requires only `project_id`: it creates a
# service account with one short-lived key.
#####################################################################################

module "service_account" {
  source = "../.."

  project_id = var.project_id
  name       = "example-sa"

  keys = {
    ci = {
      ttl_days = 7
    }
  }
}
