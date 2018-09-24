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
    key = "gcp_credentials"
    value = "${data.vault_generic_secret.gcp.data["json"]}"
    category = "terraform"
    workspace_id = "${tfe_workspace.ws.id}"
    sensitive = true
}


resource "tfe_variable" "GOOGLE_PROJECT" {
    count = "${var.gcp_vars ? 1 : 0}"
    key = "GOOGLE_PROJECT"
    value = "${data.vault_generic_secret.gcp.data["project_id"]}"
    category = "env"
    workspace_id = "${tfe_workspace.ws.id}"
    sensitive = true
}
