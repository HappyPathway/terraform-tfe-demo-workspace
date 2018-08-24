resource "tfe_variable" "AWS_ACCESS_KEY_ID" {
  count = "${var.aws_vars ? 1 : 0}"
  key = "AWS_ACCESS_KEY_ID"
  value = "${data.vault_aws_access_credentials.creds.access_key}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  count = "${var.aws_vars ? 1 : 0}"
  key = "AWS_SECRET_ACCESS_KEY"
  value = "${data.vault_aws_access_credentials.creds.secret_key}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}

resource "tfe_variable" "AWS_DEFAULT_REGION" {
  count = "${var.aws_vars ? 1 : 0}"
  key = "AWS_DEFAULT_REGION"
  value = "${var.aws_default_region}"
  category = "env"
  workspace_id = "${tfe_workspace.ws.id}"
  sensitive = true
}