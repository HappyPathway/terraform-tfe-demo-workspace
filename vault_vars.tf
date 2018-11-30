variable "vault_vars" {
    default = false
    description = "Flag for setting Vault Vars"
}

variable "vault_addr" {
    default = ""
}

variable "vault_token" {
  default = ""
}

resource "tfe_variable" "VAULT_ADDR" {
  count = "${var.vault_vars ? 1 : 0}"
  key = "VAULT_ADDR"
  value = "${var.vault_addr}"
  category = "env"
  workspace_id = "${local.workspace_id}"
  sensitive = true
}

resource "tfe_variable" "VAULT_TOKEN" {
  count = "${var.vault_vars ? 1 : 0}"
  key = "VAULT_TOKEN"
  value = "${var.vault_token}"
  category = "env"
  workspace_id = "${local.workspace_id}"
  sensitive = true
}
