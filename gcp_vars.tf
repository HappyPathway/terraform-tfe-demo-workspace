variable "vault_gcp_credentials_path" {
  default = "secret/credentials/gcp"
}

variable "gcp_vars" {
  description = "Flag for setting GCP Environment Variables"
  default = false
  type = "string"
}

data "vault_generic_secret" "gcp" {
    path = "${var.vault_gcp_credentials_path}"
}

resource "tfe_variable" "gcp_credentials" {
    count = "${var.gcp_vars ? 1 : 0}"
    key = "GOOGLE_CREDENTIALS"
    value = "${data.vault_generic_secret.gcp.data["json"]}"
    category = "env"
    workspace_id = "${module.workspace.workspace_id}"
    sensitive = true
}


resource "tfe_variable" "GOOGLE_PROJECT" {
    count = "${var.gcp_vars ? 1 : 0}"
    key = "GOOGLE_PROJECT"
    value = "${data.vault_generic_secret.gcp.data["project_id"]}"
    category = "env"
    workspace_id = "${module.workspace.workspace_id}"
    sensitive = true
}