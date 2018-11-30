variable "azure_vars" {
  default = false
  description = "Flag for setting Azure Environment Variables"
}

variable "vault_azure_credentials_path" {
  default = "secret/credentials/azure"
}

data "vault_generic_secret" "azure" {
    path = "${var.vault_azure_credentials_path}"
}

resource "tfe_variable" "ARM_SUBSCRIPTION_ID" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_SUBSCRIPTION_ID"
  value = "${data.vault_generic_secret.azure.data["subscription_id"]}"
  category = "env"
  workspace_id = "${local.workspace_id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_SECRET" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_CLIENT_SECRET"
  value = "${data.vault_generic_secret.azure.data["client_secret"]}"
  category = "env"
  workspace_id = "${local.workspace_id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_ID" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_CLIENT_ID"
  value = "${data.vault_generic_secret.azure.data["client_id"]}"
  category = "env"
  workspace_id = "${local.workspace_id}"
  sensitive = true
}

resource "tfe_variable" "ARM_TENANT_ID" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_TENANT_ID"
  value = "${data.vault_generic_secret.azure.data["tenant_id"]}"
  category = "env"
  workspace_id = "${local.workspace_id}"
  sensitive = true
}

