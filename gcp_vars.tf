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