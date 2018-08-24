resource "tfe_variable" "VAULT_ADDR" {
  count = "${var.vault_vars ? 1 : 0}"
  key = "VAULT_ADDR"
  value = "${var.vault_addr}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}

resource "tfe_variable" "VAULT_TOKEN" {
  count = "${var.vault_vars ? 1 : 0}"
  key = "VAULT_TOKEN"
  value = "${var.vault_token}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}
