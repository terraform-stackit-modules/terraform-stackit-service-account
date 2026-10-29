variable "project_id" {
  description = "STACKIT project ID to which the service account is associated."
  type        = string
}

variable "create_account" {
  description = "Whether to create the service account."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the service account."
  type        = string
}
