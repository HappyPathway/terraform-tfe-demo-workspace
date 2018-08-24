resource "tfe_variable" "ARM_SUBSCRIPTION_ID" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_SUBSCRIPTION_ID"
  value = "${data.vault_generic_secret.azure.data["subscription_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_SECRET" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_CLIENT_SECRET"
  value = "${data.vault_generic_secret.azure.data["client_secret"]}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_ID" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_CLIENT_ID"
  value = "${data.vault_generic_secret.azure.data["client_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_TENANT_ID" {
  count = "${var.azure_vars ? 1 : 0}"
  key = "ARM_TENANT_ID"
  value = "${data.vault_generic_secret.azure.data["tenant_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}

